import asyncio, inspect, threading
from langchain.tools import StructuredTool
from typing import Annotated
from typing_extensions import TypedDict
from langgraph.graph.message import add_messages
from langchain_core.messages.ai import AIMessage
from langgraph.graph import StateGraph, START, END
from langgraph.prebuilt import ToolNode
from typing import Literal
# import model rounter
from launchwiseai.llm.model_router import create_langgraph_llm
# import tools
from launchwiseai.agent.helpers import parse_langgraph_response
from launchwiseai.agent.langgraph_agent_config import LAUNCHWISE_SYSINT, WELCOME_MSG
# import MCP client functions
from launchwiseai.mcp.client_utils import sync_mcp, fetch_tool_specs

# Define LangChain wrappers for MCP tools
def make_mcp_tool(spec):
    name        = spec.name
    description = spec.description

    # Extract parameter names from inputSchema
    props  = spec.inputSchema.get("properties", {})
    params = list(props.keys())

    # build a matching signature so LangChain can introspect it
    sig_params = [
        inspect.Parameter(p, inspect.Parameter.POSITIONAL_OR_KEYWORD)
        for p in params
    ]

    signature = inspect.Signature(sig_params)

    # Build a JSON Schema for function-calling.  
    # All properties are strings and all are required.
    args_schema = {
        "type": "object",
        "properties": { p: {"type": "string"} for p in params },
        "required": params,
    }

    print(f"\ntool_name: {name}")
    print(f"args_schema: {args_schema}")

    # Define a wrapper that accepts *args
    def _run(**kwargs):
        try:
            params = kwargs

            # print(f"\nparams: {params}")

            return sync_mcp(name, params)
        except Exception as e:
            error_message = f"_run returned error: {e}"

            print(error_message)
            return error_message

    # Tell Python (and LangChain) “this is its true signature”
    _run.__signature__ = signature
    _run.__doc__       = description

    return StructuredTool.from_function(_run, name=name, description=description, args_schema=args_schema)

async def load_all_tools():
    response = await fetch_tool_specs()

    # Extract a list of tools from the response
    specs = response.tools

    return [make_mcp_tool(s) for s in specs]

def sync_load_all_tools():
    container = {}

    def _runner():
        # 1. new, independent loop
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)
        # 2. run your coroutine to completion
        container["tools"] = loop.run_until_complete(load_all_tools())
        loop.close()

    thread = threading.Thread(target=_runner)
    thread.start()
    thread.join()
    return container["tools"]

# Compile a list of all available tools
tools = sync_load_all_tools()

llm = create_langgraph_llm(model_name="gemini-2.0-flash")
# Define the tools node
tool_node = ToolNode(tools)
llm_with_tools = llm.bind_tools(tools)

class LaunchWiseState(TypedDict):
    """State representing the user's conversation."""
    messages: Annotated[list, add_messages]
    finished: bool
    new_message: str

def chatbot_node(state: LaunchWiseState) -> LaunchWiseState:
    """
    The chatbot logic node: calls the LLM via the MCP-compatible wrapper.
    """

    # If no history, send welcome
    if not state.get("messages"):
        ai_message = AIMessage(content=WELCOME_MSG)
    else:
        langgraph_contents = [LAUNCHWISE_SYSINT] + state["messages"]

        ai_message = llm_with_tools.invoke(langgraph_contents)

        # Parse the message keeping only relevant info
        ai_message = parse_langgraph_response(ai_message)

        print(f"\nAgent (chatbot_node) parsed: {ai_message}")
    
    # Append the AI response and reset finished flag
    state.setdefault("messages", []).append(ai_message)

    state["finished"] = False

    return state


def human_node(state: LaunchWiseState) -> LaunchWiseState:
    """
    The human node: injects the new user message provided by the API into the state.
    Expects `state['new_message']` to be set by the FastAPI layer.
    """

    new_msg = state.pop("new_message", None)

    # Clear the attribute once the message is copied into the state
    state["new_message"] = None

    print(f"\nAgent (human_node): {new_msg}")

    if new_msg is None:
        # No user input → mark finished so the graph stops here
        state["finished"] = True
    else:
        state.setdefault("messages", []).append(("user", new_msg))

        # check for END
        if new_msg.lower() in {"q", "quit", "exit", "goodbye"}:
            state["finished"] = True
    
    return state


def maybe_exit_human_node(state: LaunchWiseState) -> Literal["chatbot", "__end__"]:
    """Route to the chatbot, unless it looks like the user is exiting."""
    if state.get("finished", False):
        print("Agent (maybe_exit_human_node): __end__")
        return END
    else:
        print("Agent (maybe_exit_human_node): chatbot")
        return "chatbot"


def maybe_route_to_tools(state: LaunchWiseState) -> Literal["tools", "human"]:
    """
    Route to tools if the last AIMessage includes tool_calls, else to human.
    """

    last = state.get("messages", [])[-1]

    if isinstance(last, AIMessage) and getattr(last, "tool_calls", None) and len(last.tool_calls) > 0:
        print("\nAgent (maybe_route_to_tools): tools")
        return "tools"
    else:
        print("\nAgent (maybe_route_to_tools): human")
        return "human"

# Build the conversation graph
graph_builder = StateGraph(LaunchWiseState)

# Add the nodes
graph_builder.add_node("chatbot", chatbot_node)
graph_builder.add_node("human", human_node)
graph_builder.add_node("tools", tool_node)

# Chatbot may go to tools, or human
graph_builder.add_conditional_edges("chatbot", maybe_route_to_tools)
# Human may go back to chatbot, or exit
graph_builder.add_conditional_edges("human", maybe_exit_human_node)

# Tools always route back to chat afterwards
graph_builder.add_edge("tools", "chatbot")
# START always route to human
graph_builder.add_edge(START, "human")

# Compile the graph for use in FastAPI or CLI
graph = graph_builder.compile()

print("LangGraph has been compiled successfully")
