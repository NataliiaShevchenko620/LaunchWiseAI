from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from pydantic import BaseModel
from typing import Any, Dict, List
# Import LangGraph
from launchwiseai.agent.langgraph_agent import graph
# Import DB tools
from launchwiseai.data.postgres.launchwise_db_functions import LaunchWiseDB

app = FastAPI()

# Configure CORS to allow React app make calls
origins = [
    "http://localhost:5173",
    "http://localhost:3000",
    "http://localhost"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],      # GET, POST, OPTIONS, etc.
    allow_headers=["*"],      # Authorization, Content-Type, etc.
)

class ChatRequest(BaseModel):
    message: str
    state: Dict[str, Any] = None

class ChatResponse(BaseModel):
    reply: str
    parts: List[Dict[str, Any]]
    state: Dict[str, Any]

@app.post("/chat", response_model=ChatResponse)
def chat_endpoint(request: ChatRequest):
    # 1. Initialize a fresh conversation state
    state = request.state or {"messages": [], "finished": False}

    # 2. Inject the incoming user message for the human_node to pick up
    state["new_message"] = request.message

    state = graph.invoke(state)

    # 4. Extract the last reply
    last_msg = state["messages"][-1]

    # 5. Content and full MCP parts
    text = getattr(last_msg, "content", "")

    parts = getattr(last_msg, "parts", [{"text": text}])

    # 6. Add inline data
    launchwise_db = LaunchWiseDB(conversation_id = 1)

    inline_data = launchwise_db.get_inline_data()

    if not inline_data == []:
        parts.extend(inline_data)

        # Clear inline data
        launchwise_db.clear_inline_data()

    return ChatResponse(reply=text, parts=parts, state=state)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(
        "launchwiseai.api.main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
    )
