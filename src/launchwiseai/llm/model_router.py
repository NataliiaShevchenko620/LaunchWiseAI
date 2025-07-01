from typing import List
from google import genai
from google.genai import types
from langchain_google_genai import ChatGoogleGenerativeAI
from launchwiseai.config.config import GOOGLE_API_KEY

# Call LLM with tools
def call_llm_model_with_tools(model_name: str, contents: list, tools: list = None):
    """Universal model caller using MCP-compatible input for any supported LLM."""
    if "gemini" in model_name:
        client = genai.Client(api_key=GOOGLE_API_KEY)
    
        """
        - Gemini’s GenerateContent is a simpler “completions” endpoint that doesn’t implement 
          the full chat API with separate system/user/assistant roles.

        - Claude and OpenAI chat‐styled endpoints do support a distinct system role — but Google’s current API does not.

        - By normalizing or merging your system instructions into a user frame 
          (or renaming them under the hood), you keep the rest of your MCP‐style code unchanged, but satisfy Gemini’s requirements.
        
        """

        # Extract system role's text into the system_instruction
        system_instruction = None
        user_contents = []
        
        for frame in contents:
            if frame.get("role") == "system":
                # join all text parts into one system_instruction string
                system_instruction = "".join(p.get("text", "") for p in frame.get("parts", []))
            else:
                user_contents.append(frame)

        # Convert generic tool names to Gemini's specific ones
        TOOL_FACTORIES = {
            "web_search":       lambda: types.Tool(google_search=types.GoogleSearch()),
            "code_execution":   lambda: types.Tool(code_execution=types.ToolCodeExecution()),
        }

        if tools:
            tools_list = []

            for t in tools:
                if isinstance(t, str):
                    factory = TOOL_FACTORIES.get(t)

                    if not factory:
                        raise ValueError(f"Unknown tool name: {t!r}")
                    
                    tools_list.append(factory())
                else:
                    tools_list.append(t)
        else:
            tools_list = []

        # Define config
        config = types.GenerateContentConfig(
            system_instruction=system_instruction,
            tools=tools_list or [],
            temperature=0.0
        )

        # Call Gemini LLM
        return client.models.generate_content(
            model=model_name,
            contents=user_contents,
            config=config
        )
    else:
        raise ValueError(f"Unsupported model: {model_name}")

    """
    elif "claude" in model_name:
        # Anthropic Claude call (also uses MCP-like message schema)
        return anthropic_client.messages.create(
            model=model_name,
            system=contents[0]["parts"][0]["text"],
            messages=contents[1:],
            tools=tools or []
        )

    elif "gpt" in model_name:
        # OpenAI GPT call (need to convert to OpenAI message format)
        openai_messages = convert_mcp_to_openai(contents)
        return openai.ChatCompletion.create(
            model=model_name,
            messages=openai_messages,
            tools=tools or [],
            temperature=0.0
        )
    """

# Create LLM for LangGraph
def create_langgraph_llm(model_name: str):
    if "gemini" in model_name:
        llm = ChatGoogleGenerativeAI(model=model_name, api_key=GOOGLE_API_KEY)

        return llm
    else:
        raise ValueError(f"Unsupported model: {model_name}")
