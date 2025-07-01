import asyncio
import sys
import os
from mcp.client.streamable_http import streamablehttp_client
from mcp import ClientSession

MCP_URL = os.getenv("MCP_URL")

async def mcp_call(name: str, params: dict):
    async with streamablehttp_client(MCP_URL) as (r, w, _):
        async with ClientSession(r, w) as sess:
            await sess.initialize()
            return await sess.call_tool(name, params)

def sync_mcp(name: str, params: dict):
    print(f"Call {name} with {params}")

    print(f"sys.platform: {sys.platform}")

    if sys.platform.startswith("win"):
        # Use SelectorEventLoop instead of ProactorEventLoop
        asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())

    return asyncio.run(mcp_call(name, params))
