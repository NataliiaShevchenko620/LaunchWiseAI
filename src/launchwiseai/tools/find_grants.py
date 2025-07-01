from launchwiseai.llm.model_router import call_llm_model_with_tools

def find_grants(business: str, location: str) -> str:
    """
    Tool that finds small business grants for the given business and location.
    """
    
    query = f"What grants or small business funding programs are available for a {business} business in {location}?"

    # Build MCP-style input
    contents = [
        {"role": "system", "parts": [{"text": "You are a legal regulations assistant."}]},
        {"role": "user", "parts": [{"text": query}]}
    ]

    # Select model
    model_choice = "gemini-2.0-flash"

    # Call model using MCP-compatible wrapper
    response = call_llm_model_with_tools(
        model_name=model_choice,
        contents=contents,
        tools=["web_search"]
    )

    return str(response)
