from mcp.server.fastmcp import FastMCP
# import custom tools
from launchwiseai.tools.analyze_market_opportunity import analyze_market_opportunity
from launchwiseai.tools.check_regulations import check_regulations
from launchwiseai.tools.create_chart import create_chart
from launchwiseai.tools.find_grants import find_grants
from launchwiseai.tools.get_census_demographics import get_census_demographics
from launchwiseai.tools.get_industry_insights import get_industry_insights
from launchwiseai.tools.get_metric_value import get_metric_value
from launchwiseai.tools.get_metric_value_trend import get_metric_value_trend
from launchwiseai.tools.show_options import show_options

# Create MCP server instance
mcp = FastMCP(
    name="LaunchWiseAI Tools Server",
    host="0.0.0.0",
    port=8080
)

# Define MCP wrappers for tools
@mcp.tool(
        name = "analyze_market_opportunity",
        description="""
        Analyze market opportunity for a given business in a specified county and state.
        The analysis gathers similar counties, counts competitors, generates charts, and concludes on market saturation.

        Args:
            county_name (str): County name without the word "county" (e.g., 'Hudson').
            state_name (str): Full state name (e.g., 'New Jersey').
            business (str): Type of business (e.g., 'cleaning', 'coffee shop').
        """
)
def analyze_market_opportunity_mcp(county_name: str, state_name: str, business: str) -> str:        
    # Call the tool function
    try:
        result = analyze_market_opportunity(county_name = county_name, state_name = state_name, business = business)

        return result
    except Exception as e:
        error_message = f"Tool analyze_market_opportunity returned error: {e}"

        print(error_message)
        return error_message

@mcp.tool(
        name = "check_regulations",
        description="""
        Tool that finds and summarizes legal regulations for a given business and location
        
        Args:
            business (str): Type of business (e.g., 'cleaning', 'coffee shop').
            location (str): Location in format county name, state name, e.g. Hudson, New Jersey
        """
)
def check_regulations_mcp(business: str, location: str) -> str: 
    # Call the tool function
    try:
        result =  check_regulations(business = business, location = location)

        return result
    except Exception as e:
        error_message = f"Tool check_regulations returned error: {e}"

        print(error_message)
        return error_message

@mcp.tool(
        name = "create_chart",
        description="""
        Creates a chart based on the provided query that contains a chart description and data.

        Args:
            query (str): A free text description that includes details on what kind of chart to build and the data for it.

        Returns:
            str: A confirmation message indicating the chart has been created, or an error message.
        """
)
def create_chart_mcp(query: str) -> str:
    # Call the tool function
    try:
        result =  create_chart(query = query)

        return result
    except Exception as e:
        error_message = f"Tool create_chart returned error: {e}"

        print(error_message)
        return error_message

@mcp.tool(
        name = "find_grants",
        description="""
        Tool that finds small business grants for the given business and location.
        
        Args:
            business (str): Type of business (e.g., 'cleaning', 'coffee shop').
            location (str): Location in format county name, state name, e.g. Hudson, New Jersey
        """
)
def find_grants_mcp(business: str, location: str) -> str:
    # Call the tool function
    try:
        result = find_grants(business = business, location = location)

        return result
    except Exception as e:
        error_message = f"Tool find_grants returned error: {e}"

        print(error_message)
        return error_message

@mcp.tool(
        name = "get_census_demographics",
        description="""
        Retrieve U.S. Census demographics for the given county and state.
        
        Args:
            county_name (str): County name without the word "county" (e.g., 'Hudson').
            state_name (str): Full state name (e.g., 'New Jersey').
        """
)
def get_census_demographics_mcp(county_name: str, state_name: str) -> str:
    # Call the tool function
    try:
        result = get_census_demographics(county_name = county_name, state_name = state_name)

        return result
    except Exception as e:
        error_message = f"Tool get_census_demographics returned error: {e}"

        print(error_message)
        return error_message

@mcp.tool(
        name = "get_industry_insights",
        description="""
        Retrieve industry insights for a given business using ChromaDB and Gemini.

        Args:
            business (str): Type of business (e.g., 'cleaning', 'coffee shop').

        Returns:
            str: A summarized string of insights or an error message.
        """
)
def get_industry_insights_mcp(business: str) -> str:
    # Call the tool function
    try:
        result = get_industry_insights(business = business)

        return result
    except Exception as e:
        error_message = f"Tool get_industry_insights returned error: {e}"

        print(error_message)
        return error_message

@mcp.tool(
        name = "get_metric_value",
        description="""
        Returns the latest value of a given metric in a specific county.

        Args:
            county_name (str): Name of the county (e.g., 'Hudson'), without the word 'county'.
            state_name (str): Full state name (e.g., 'New Jersey').
            metric_name (str): Metric name - must be one of:
                "Per capita income", "Population", or "Unemployment rate".

        Returns:
            str: JSON-formatted string with the result or error message.
        """
)
def get_metric_value_mcp(county_name: str, state_name: str, metric_name: str) -> str:
    # Call the tool function
    try:
        result = get_metric_value(county_name = county_name, state_name = state_name, metric_name = metric_name)

        return result
    except Exception as e:
        error_message = f"Tool get_metric_value returned error: {e}"

        print(error_message)
        return error_message

@mcp.tool(
        name = "get_metric_value_trend",
        description="""
        Returns the trend by years of a given metric for a specific county.

        Args:
            county_name (str): County name without the word "county" (e.g., 'Hudson').
            state_name (str): Full state name (e.g., 'New Jersey').
            metric_name (str): One of the pre-defined metrics - 
                "Per capita income", "Population", "Unemployment rate".

        Returns:
            str: JSON string with list of (metric_value, year) or error message.
        """
)
def get_metric_value_trend_mcp(county_name: str, state_name: str, metric_name: str) -> str:         
    # Call the tool function
    try:
        result = get_metric_value_trend(county_name = county_name, state_name = state_name, metric_name = metric_name)

        return result
    except Exception as e:
        error_message = f"Tool get_metric_value_trend returned error: {e}"

        print(error_message)
        return error_message

@mcp.tool(
        name = "show_options",
        description="""
        Tool that provides the options.
        
        Args:
            business (str): Type of business (e.g., 'cleaning', 'coffee shop').
        """
)
def show_options_mcp(business: str) -> str:
    # Call the tool function
    try:
        result = show_options()

        return result
    except Exception as e:
        error_message = f"Tool show_options returned error: {e}"

        print(error_message)
        return error_message

# Define MCP wrapers for prompts
@mcp.prompt("full_list_of_tools")
def full_list_of_tools() -> str:
    prompt = """
1. create_chart:
- Purpose: Generates a visual chart based on a natural language description that includes chart type, data to display, and other details.
- Output: Returns a confirmation message once the chart is created, which you may reference for further analysis.

2. check_regulations:
- Purpose: Searches and summarizes legal regulations specific to the type of business in the target county and state.
- Output: Provides a summarized text of applicable legal requirements and guidelines.

3. get_industry_insights:
- Purpose: Queries a ChromaDB collection to retrieve internal evaluation guidelines and industry-specific insights.
- Output: Returns textual insights structured in key-value pairs (e.g., relevant metrics or industry classifications).

4. get_census_demographics:
- Purpose: Retrieves demographic data (including population counts, density, age, and gender breakdown) from the U.S. Census.
- Output: Returns formatted census information for the target county and state.

5. find_grants:
- Purpose: Searches for available grants and small business funding programs applicable to the business opportunity based on location.
- Output: Returns a JSON-formatted string containing grant and funding information or an error message.

6. get_metric_value:
- Purpose: Retrieves the current value of a specified metric (e.g., "Per capita income", "Population", "Unemployment rate") for a given county and state.
- Output: Returns the metric value as a plain string or a JSON string with error details if applicable.

7. get_metric_value_trend:
- Purpose: Retrieves historical trend data for a given metric (e.g., "Per capita income", "Population", "Unemployment rate") in a specific county.
- Output: Returns a JSON-formatted list of value-year pairs or a plain string summarizing the trend over years.

8. analyze_market_opportunity:
- Purpose: Delegates a full multi-step market analysis, coordinating data from similar counties, competitor counts, legal and regulatory reviews, demographic insights, metric evaluations, and visualizations.
- Output: Returns a structured final analysis that includes visualizations, summary conclusions, and actionable recommendations.

9. show_options:
- Purpose: Presents user-selectable options or next-step recommendations based on the current analysis findings.
- Output: Returns a list of available options or instructions for selecting the next action in a Markdown text format.
    """

    return prompt

# Create server
if __name__ == "__main__":
    mcp.run(
        transport="streamable-http"
    )

