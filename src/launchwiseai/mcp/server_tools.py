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
@mcp.tool(name = "analyze_market_opportunity_mcp")
def analyze_market_opportunity_mcp(params: dict[str, str]) -> str:
    # Unpack parameters
    county_name = params["county_name"]
    state_name = params["state_name"]
    business = params["business"]
         
    # Call the tool function
    return analyze_market_opportunity(county_name = county_name, state_name = state_name, business = business)

@mcp.tool(name = "check_regulations_mcp")
def check_regulations_mcp(params: dict[str, str]) -> str:
    # Unpack parameters
    business = params["business"]
    location = params["location"]
         
    # Call the tool function
    return check_regulations(business = business, location = location)

@mcp.tool(name = "create_chart_mcp")
def create_chart_mcp(params: dict[str, str]) -> str:
    # Unpack parameters
    query = params["query"]
         
    # Call the tool function
    return create_chart(query = query)

@mcp.tool(name = "find_grants_mcp")
def find_grants_mcp(params: dict[str, str]) -> str:
    # Unpack parameters
    business = params["business"]
    location = params["location"]
         
    # Call the tool function
    return find_grants(business = business, location = location)

@mcp.tool(name = "get_census_demographics_mcp")
def get_census_demographics_mcp(params: dict[str, str]) -> str:
    # Unpack parameters
    county_name = params["county_name"]
    state_name = params["state_name"]
         
    # Call the tool function
    return get_census_demographics(county_name = county_name, state_name = state_name)

@mcp.tool(name = "get_industry_insights_mcp")
def get_industry_insights_mcp(params: dict[str, str]) -> str:
    # Unpack parameters
    business = params["business"]
         
    # Call the tool function
    return get_industry_insights(business = business)

@mcp.tool(name = "get_metric_value_mcp")
def get_metric_value_mcp(params: dict[str, str]) -> str:
    # Unpack parameters
    county_name = params["county_name"]
    state_name = params["state_name"]
    metric_name = params["metric_name"]
         
    # Call the tool function
    return get_metric_value(county_name = county_name, state_name = state_name, metric_name = metric_name)

@mcp.tool(name = "get_metric_value_trend_mcp")
def get_metric_value_trend_mcp(params: dict[str, str]) -> str:
    # Unpack parameters
    county_name = params["county_name"]
    state_name = params["state_name"]
    metric_name = params["metric_name"]
         
    # Call the tool function
    return get_metric_value_trend(county_name = county_name, state_name = state_name, metric_name = metric_name)

@mcp.tool(name = "show_options_mcp")
def show_options_mcp(params: dict[str, str]) -> str:
    # Unpack parameters
    business = params["business"]

    # Call the tool function
    return show_options()

# Create server
if __name__ == "__main__":
    mcp.run(
        transport="streamable-http"
    )
