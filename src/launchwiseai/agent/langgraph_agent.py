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
from launchwiseai.agent.langgraph_agent_config import LAUNCHWISE_SYSINT, WELCOME_MSG, tools


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
