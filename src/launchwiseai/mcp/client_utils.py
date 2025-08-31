import asyncio
import os
from mcp.client.streamable_http import streamablehttp_client
from mcp import ClientSession

MCP_URL = os.getenv("MCP_URL")

# Call MCP tool functions
async def mcp_call(name: str, params: dict):
    async with streamablehttp_client(MCP_URL) as (r, w, _):
        async with ClientSession(r, w) as session:
            await session.initialize()
            return await session.call_tool(name, params)

def sync_mcp(name: str, params: dict):
    # pass all keyword args through directly
    return asyncio.run(mcp_call(name, params))
    
# Get MCP tools specifications function
async def fetch_tool_specs():
    async with streamablehttp_client(MCP_URL) as (r, w, _):
        async with ClientSession(r, w) as session:
            await session.initialize()
            return await session.list_tools()

# Get prompt from MCP server function
async def get_prompt(prompt_name: str):
    async with streamablehttp_client(MCP_URL) as (r, w, _):
        async with ClientSession(r, w) as session:
            await session.initialize()
            return await session.get_prompt(prompt_name)