from launchwiseai.llm.model_router import call_llm_model_with_tools
from launchwiseai.tools.get_similar_counties_by_metric import get_similar_counties_by_metric
from launchwiseai.tools.count_competitors import count_competitors
from launchwiseai.tools.create_chart import create_chart

def analyze_market_opportunity(county_name: str, state_name: str, business: str) -> str:
    """
    Analyze market opportunity for a given business in a specified county and state.
    The analysis gathers similar counties, counts competitors, generates charts, and concludes on market saturation.

    Args:
        county_name (str): County name without the word "county" (e.g., 'Hudson').
        state_name (str): Full state name (e.g., 'New Jersey').
        business (str): Type of business (e.g., 'cleaning', 'coffee shop').
    """

    get_similar_counties_by_metric_description = """
    Finds the top 5 counties in the US with the most similar metric value to the given county.
    Similarity means that the metric is between 90% and 110% of the current county's metric.

    Args:
        county_name (str): County name without the word "county" (e.g., 'Hudson').
        state_name (str): Full state name (e.g., 'New Jersey').
        metric_name (str): One of: "Per capita income", "Population", "Unemployment rate".

    Returns:
        str: JSON string with list of similar counties or an error message.
    """

    count_competitors_description = """
    Uses Google Places API to count businesses in a given industry and county.
    Helps determine how saturated the market is.

    Args:
        business (str): Type of business (e.g., 'cleaning', 'coffee shop').
        location (str): County and state (e.g., 'Hudson County, New Jersey').

    Returns:
        str: JSON-formatted result with competitor count or error message.   
    """

    create_chart_description = """
    Creates a chart based on the specified query that contains a chart description and data.

    Args:
        query (str): A free text description that includes details on what kind of chart to build and the data for it.

    Returns:
        str: A confirmation message indicating the chart has been created, or an error message.
    """

    # System prompt that provides step-by-step instructions to the LLM.
    system_instruction = f"""
        You are a business opportunity analyst.
        Your task is to assess the saturation of a business market in a given county.
        You must:
        1. Call get_similar_counties_by_metric to get top 5 similar counties for the specified county and state and metric "Per capita income"
        2. Call count_competitors for each county (including the target county and its similar peers) to obtain competitor counts.
        3. Compute the median competitor count and compare it with the target county's competitor count to determine saturation.
        4. Call create_chart to generate a column chart that shows competitor counts for the target county, similar counties, and the median value. Median value should be visualized as a red dashed line.\n"
        5. Provide a summary and final conclusion on whether the market is open or saturated.
                     
        Tool definitions:
        - get_similar_counties_by_metric: {get_similar_counties_by_metric_description}
        - count_competitors: {count_competitors_description}
        - create_chart: {create_chart_description}

        If you encounter any error with any tools, please try one more time, but do not run the not working tool in a loop.

        Important: do not skip any steps of the instruction, execute it from point 1 to point 5.
    """
    
    # Build the query that instructs the LLM about the analysis to be performed.
    query = f"""Analyze the potential for a '{business}' business in {county_name}, {state_name}. 
    Consider 'Per capita income' as a key metric along with competitor counts.
    Use the available tools to gather insights and determine market saturation.
    If there are any errors in any step, print the error message. 
    For each step, please return the step description, progress, and results.
    If any error occurs, print the error message clearly."""

    # Prepare the configuration to include the available tools.
    tools = [get_similar_counties_by_metric, count_competitors, create_chart]

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
        tools=tools
    )

    # print(f"\nanalyze_market_opportunity: {response}")

    return str(response)
