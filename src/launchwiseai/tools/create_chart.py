from launchwiseai.llm.model_router import call_llm_model_with_tools
from launchwiseai.data.postgres.launchwise_db_functions import LaunchWiseDB

def create_chart(query: str):
    """
    Creates a chart based on the provided query that contains a chart description and data.

    Args:
        query (str): A free text description that includes details on what kind of chart to build and the data for it.

    Returns:
        str: A confirmation message indicating the chart has been created, or an error message.
    """

    system_instruction = (
        "You are a charting assistant. Use the code_execution tool to run Python "
        "that creates your chart and returns the image. Do not return code or text—"
        "only invoke the code_execution tool so that the response will include the "
        "chart as inline_data."
    )

    # Build MCP-style input
    contents = [
        {"role": "system", "parts": [{"text": system_instruction}]},
        {"role": "user", "parts": [{"text": query}]}
    ]
    
    # Select model
    model_choice = "gemini-2.0-flash"

    # Call model using MCP-compatible wrapper
    response = call_llm_model_with_tools(
        model_name=model_choice,
        contents=contents,
        tools=["code_execution"]
    )

    # Store inline data to a staging table
    launchwise_db = LaunchWiseDB(conversation_id = 1)

    # Initialize a list to keep all content, but inline_data
    clean_parts = []

    for p in response.candidates[0].content.parts:
        if p.inline_data:
            launchwise_db.add_inline_data("create_chart", p.inline_data.data)

            del p.inline_data

        # Keep only needed part in the response
        clean_parts.append(p)

    response.candidates[0].content.parts = clean_parts

    return str(response)
