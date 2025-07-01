from langchain_core.messages.ai import AIMessage
from typing import List, Dict, Any

def parse_langgraph_response(message: AIMessage) -> AIMessage:
    """
    Parses the raw LLM response, turn it into a minimal message object

    For each assistant turn you only need:
    - Role (assistant)
    - Content (the text to use as context)
    - Any parts that contain structured data or tool_calls that the graph needs to act on

    All of the other fields (id, usage_metadata, response_metadata, etc.) can safely be dropped 
    once you’ve extracted your content, parts, and any function/tool‐call signals.
    """

    # Build a fresh AIMessage with just content
    msg = AIMessage(content=message.content)
                    
    # msg.additional_kwargs = message.additional_kwargs

    # If you rely on tool_calls in the graph, carry just that
    if hasattr(message, "tool_calls"):
        msg.tool_calls = message.tool_calls
    
    return msg
