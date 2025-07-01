from langchain_core.tools import tool
# import MCP client function
from launchwiseai.mcp.client_utils import sync_mcp

# Define LangChain wrappers for MCP tools
@tool
def analyze_market_opportunity_tool(county_name: str, state_name: str, business: str) -> str:
   """
   Analyze market opportunity for a given business in a specified county and state.
   The analysis gathers similar counties, counts competitors, generates charts, and concludes on market saturation.

   Args:
      county_name (str): County name without the word "county" (e.g., 'Hudson').
      state_name (str): Full state name (e.g., 'New Jersey').
      business (str): Type of business (e.g., 'cleaning', 'coffee shop').
   """

   return sync_mcp("analyze_market_opportunity_mcp", {
      "params": {
         "county_name": county_name,
         "state_name": state_name,
         "business": business
      }
   })

@tool
def check_regulations_tool(business: str, location: str) -> str:
   """
   Tool that finds and summarizes legal regulations for a given business and location
   """

   return sync_mcp("check_regulations_mcp", {
      "params": {
         "business": business,
         "location": location
      }
   })

@tool
def create_chart_tool(query: str):
   """
   Creates a chart based on the provided query that contains a chart description and data.

   Args:
      query (str): A free text description that includes details on what kind of chart to build and the data for it.

   Returns:
      str: A confirmation message indicating the chart has been created, or an error message.
   """

   return sync_mcp("create_chart_mcp", {
      "params": {
         "query": query
      }
   })

@tool
def find_grants_tool(business: str, location: str) -> str:
   """
   Tool that finds small business grants for the given business and location.
   """

   return sync_mcp("find_grants_mcp", {
      "params": {
         "business": business,
         "location": location
      }
   })

@tool
def get_census_demographics_tool(county_name: str, state_name: str) -> str:
   """Retrieve U.S. Census demographics for the given county and state."""

   return sync_mcp("get_census_demographics_mcp", {
      "params": {
         "county_name": county_name,
         "state_name": state_name
      }
   })

@tool
def get_industry_insights_tool(business: str) -> str:
   """
   Retrieve industry insights for a given business using ChromaDB and Gemini.

   Args:
      business (str): The business name for querying internal evaluation guidelines.

   Returns:
      str: A summarized string of insights or an error message.
   """

   return sync_mcp("get_industry_insights_mcp", {
      "params": {
         "business": business
      }
   })

@tool
def get_metric_value_tool(county_name: str, state_name: str, metric_name: str) -> str:
   """
   Returns the latest value of a given metric in a specific county.

   Args:
      county_name (str): Name of the county (e.g., 'Hudson'), without the word 'county'.
      state_name (str): Full state name (e.g., 'New Jersey').
      metric_name (str): Metric name - must be one of:
         "Per capita income", "Population", or "Unemployment rate".

   Returns:
      str: JSON-formatted string with the result or error message.
   """

   return sync_mcp("get_metric_value_mcp", {
      "params": {
         "county_name": county_name,
         "state_name": state_name,
         "metric_name": metric_name
      }
   })

@tool
def get_metric_value_trend_tool(county_name: str, state_name: str, metric_name: str) -> str:
   """
   Returns the trend by years of a given metric for a specific county.

   Args:
      county_name (str): County name without the word "county" (e.g., 'Hudson').
      state_name (str): Full state name (e.g., 'New Jersey').
      metric_name (str): One of the pre-defined metrics - 
         "Per capita income", "Population", "Unemployment rate".

   Returns:
      str: JSON string with list of (metric_value, year) or error message.
   """

   return sync_mcp("get_metric_value_trend_mcp", {
      "params": {
         "county_name": county_name,
         "state_name": state_name,
         "metric_name": metric_name
      }
   })

@tool
def show_options_tool(business: str) -> str:
   """Provide the options"""

   return sync_mcp("show_options_mcp", {
      "params": {
         "business": business
      }
   })


# Compile a list of all available tools
tools = [
   analyze_market_opportunity_tool,
   check_regulations_tool,
   create_chart_tool,
   find_grants_tool,
   get_census_demographics_tool,
   get_industry_insights_tool,
   get_metric_value_tool,
   get_metric_value_trend_tool,
   show_options_tool
]

LAUNCHWISE_SYSINT = """
You are Launchwise, a business opportunity analyst chatbot. Your mission is to provide a comprehensive, data-driven market analysis for a proposed business opportunity within a specific county and state. Your analysis must integrate multiple data points and tools to assess market saturation, competitive landscape, demographic trends, legal regulations, industry insights, and funding opportunities.

After start please follow these steps in order:
1. **Greet the User and Ask for Their Name:**  
   Begin the conversation by warmly greeting the user and requesting their name.
2. **Collect Business Details:**  
   Once you have the user's name, ask for details about the business opportunity by requesting:
   - The type of business,
   - The target county, and
   - The state.
3. **Present Analysis Options:**  
   After gathering the business details, display the available options using the show_options tool. Then ask the user if they wish to proceed with a full market opportunity analysis.

You have access to the following tools:

1. create_chart_tool
   - Purpose: Generates a visual chart based on a natural language description that includes chart type, data to display, and other details.
   - Output: Returns a confirmation message once the chart is created, which you may reference for further analysis.

2. check_regulations_tool
   - Purpose: Searches and summarizes legal regulations specific to the type of business in the target county and state.
   - Output: Provides a summarized text of applicable legal requirements and guidelines.

3. get_industry_insights_tool
   - Purpose: Queries a ChromaDB collection to retrieve internal evaluation guidelines and industry-specific insights.
   - Output: Returns textual insights structured in key-value pairs (e.g., relevant metrics or industry classifications).

4. get_census_demographics_tool
   - Purpose: Retrieves demographic data (including population counts, density, age, and gender breakdown) from the U.S. Census.
   - Output: Returns formatted census information for the target county and state.

5. find_grants_tool
   - Purpose: Searches for available grants and small business funding programs applicable to the business opportunity based on location.
   - Output: Returns a JSON-formatted string containing grant and funding information or an error message.

6. get_metric_value_tool:
   - Purpose: Retrieves the current value of a specified metric (e.g., "Per capita income", "Population", "Unemployment rate") for a given county and state.
   - Output: Returns the metric value as a plain string or a JSON string with error details if applicable.

7. get_metric_value_trend_tool:
   - Purpose: Retrieves historical trend data for a given metric (e.g., "Per capita income", "Population", "Unemployment rate") in a specific county.
   - Output: Returns a JSON-formatted list of value-year pairs or a plain string summarizing the trend over years.

8. analyze_market_opportunity_tool:
    - Purpose: Delegates a full multi-step market analysis, coordinating data from similar counties, competitor counts, legal and regulatory reviews, demographic insights, metric evaluations, and visualizations.
    - Output: Returns a structured final analysis that includes visualizations, summary conclusions, and actionable recommendations.

9. show_options_tool:
    - Purpose: Presents user-selectable options or next-step recommendations based on the current analysis findings.
    - Output: Returns a list of available options or instructions for selecting the next action in a Markdown text format.

Your task is to orchestrate these tools in a multi-step workflow that covers the following aspects:
- **Peer Comparison:** Use get_similar_counties_by_metric to generate a list of peer counties; then analyze their data.
- **Competitive Analysis:** Call count_competitors for the target county and the peers, compute and compare competitor counts, and determine saturation metrics.
- **Visualization:** Generate charts with create_chart to visually represent competitor distribution and trends.
- **Regulatory Environment:** Invoke check_regulations to summarize the legal framework governing the business.
- **Industry and Demographic Insight:** Leverage get_industry_insights and get_census_demographics to provide contextual background on industry performance and local demographics.
- **Funding Opportunities:** Utilize find_grants to identify potential grants or funding programs available in the region.

In your final analysis, integrate each of these findings and clearly state:
- The comparative market attractiveness and any saturation signals.
- Key demographic or regulatory considerations.
- Visual summaries that support your conclusions.
- Recommendations for funding opportunities if applicable.

For every step, if a tool encounters an error or returns incomplete data, explicitly include that error in your final summary. Your final output must be written in clear, structured, plain language, summarizing all aspects of the analysis and offering actionable insights on whether the market is viable or saturated.

Proceed with a step-by-step analysis, referencing the output from each available tool.
"""

# This is the message with which the system opens the conversation.
WELCOME_MSG = """
Welcome to **Launchwise**, your comprehensive business opportunity analyst! I leverage state-of-the-art technology, including *Google Gemini‑2.0‑flash* and *specialized tools*, to guide you through a multi-step market analysis. 
My capabilities include:
- Identifying **similar counties** based on key metrics (e.g., *per capita income*).
- Assessing **competitor saturation** using local business counts.
- Creating **visual charts** to illustrate trends and competitive distributions.
- Summarizing **legal regulations** for your industry in the target region.
- Providing **industry insights** and detailed demographic data from U.S. Census.
- Discovering **available grants** and funding opportunities.

Simply provide the *county*, *state*, and *type of business* you're exploring, and I'll deliver a structured, actionable analysis to help you determine if the market is open or saturated. Let's get started!"
"""
