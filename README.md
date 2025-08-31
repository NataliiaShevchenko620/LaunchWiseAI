# LaunchWiseAI

**LaunchWiseAI** is a smart, AI-powered startup launch assistant designed to help entrepreneurs and product teams streamline market entry, tooling, and research. It's ideal for bringing new products to market faster, with data-led insights and automation.

---

## 1. Business Goal
LaunchWiseAI aims to **empower startup founders and product teams** by providing:
- Market analysis & go-to-market guidance
- Generated landing pages and feature outlines
- Tool integration suggestions
- A centralized platform to accelerate launch preparation

In short, it guides users through the startup launch process seamlessly—from research to MVP readiness.

---

## 2. Implemented Tools & Business Use Cases
- **Chroma DB** – Used as an efficient vector store for embedding-based semantic searches; helps build intelligent Q&A and knowledge retrieval
- **PostgreSQL** – Reliable, structured relational database used for user data, session tracking, and transactional storage
- **Specialized Prompt Interfaces** – Functions to perform Gen AI calls for such cases as checking regulations for a business in a selected location, looking for grants for the business, or generatign charts by a prompt
- **External APIs** - Functions to perform calls to external APIs, such as Google Places (to count competitors in the location) or Census to get official statistics for the location

---

## 3. Technologies Involved
- **Python** (79%) and **JavaScript** (12%) – Backend logic and interactive components
- **CSS / HTML** – Frontend presentation
- **Docker & docker-compose** – Containerization for Lambda-like environments
- **ChromaDB** – Fast vector indexing & storage
- **PostgreSQL** – Relational database
- **pip / setup.py** – Package management for Python module installation

---

## 4. Folder Structure

### 📂 `src/launchwiseai/` — detailed breakdown

```
LaunchWiseAI-main/
├── .env.example              # Sample environment configuration
├── .gitignore
├── LICENSE
├── README.md
├── docker-compose.yml        # Defines a Docker container setup
├── setup.py                  # Python package definition for launchwiseai package
│
├── chroma/
│   └── Dockerfile            # ChromaDB container build file
│
├── chroma_db/
│   └── chroma.sqlite3        # Embedded ChromaDB database containing industry insights
│
├── postgres/
│   ├── Dockerfile            # PostgreSQL container build file
│   └── launchwise_dump.sql   # Backup file with data for statistics tables
│
├── resources/
│   └── industry_insights/    # Source files for Chroma DB industry insights
│
└── src/
    └── launchwiseai/         # Core business logic and tooling (inferred subfolder)
        ├── __init__.py
        │
        ├── agent/                          # LangGraph-based orchestration layer
        │   ├── helpers.py                  # Service functions LangGraph/LangChain 
        │   ├── langgraph_agent.py          # Builds the multi-agent LangGraph/LangChain 
        │   └── langgraph_agent_config.py   # LangChain tools definitions, system instuction and a welcome message
        │
        ├── api/                            # FastAPI server that exposes LaunchWiseAI /chat endpoint
        │   ├── Dockerfile
        │   ├── __init__.py
        │   └── main.py                     # `uvicorn` entry-point with OpenAPI docs
        │
        ├── config/                         # Centralised runtime configuration
        │   ├── __init__.py
        │   └── config.py                   # Loads .env / environment variables
        │
        ├── data/                           # Utils to work with vector Chroma DB and PostreSQL
        │   ├── chromadb/                   
        |   |   ├── __init__.py
        |   |   ├── document_loader.py      # Utility to read content of text industry insights documents
        |   |   ├── load_documents.py       # Utility for loading/updating industry insights documents to the vector DB
        |   |   └── vectorizer.py           # Utils for working with embeddings for the vector DB
        │   └── postgres/                   
        |       ├── __init__.py
        |       ├── launchwise_db_conn.py       # Common function that initializes connection to Postgres DB
        |       └── launchwise_db_functions.py  # Class to handle staging inline data from tools in Postgres DB 
        │
        ├── launchwise-react-app/           # Front-end built with React + Vite
        │   └── …                           # See its own README for details
        │
        ├── llm/                            # Model routing & common LLM helpers
        │   ├── __init__.py
        │   └── model_router.py             # Lets you switch between Gemini / OpenAI, etc. (currently only Gemini is supported)
        │
        ├── mcp/                            # FastMCP server & client helpers
        │   ├── Dockerfile
        │   ├── client_utils.py             # Common functions for sync and async MCP tools calls
        │   └── server_tools.py             # Defines FastMCP server and registers all available tools
        │
        └── tools/                          # Atomic, reusable “skills” the agent can invoke, see the detailes below
            ├── __init__.py
            ├── analyze_market_opportunity.py
            ├── check_regulations.py
            ├── count_competitors.py
            ├── create_chart.py
            ├── find_grants.py
            ├── get_census_demographics.py
            ├── get_industry_insights.py
            ├── get_metric_value.py
            ├── get_metric_value_trend.py
            ├── get_similar_counties_by_metric.py
            └── show_options.py
```

---

## 5. Tool quick-reference

| Tool (module)                          | Purpose — first line of its doc-string                                                      |
| -------------------------------------- | ------------------------------------------------------------------------------------------- |
| **analyze\_market\_opportunity**       | Analyze market opportunity for a given business in a specified county and state.            |
| **check\_regulations**                 | Finds & summarises legal requirements for a business at a given location.                   |
| **count\_competitors**                 | Uses Google Places to count how many competitors operate in the target county.              |
| **create\_chart**                      | Generates a chart from structured data + natural-language chart description.                |
| **find\_grants**                       | Searches for small-business grants relevant to the chosen industry and region.              |
| **get\_census\_demographics**          | Retrieves US Census demographics **[1]** for the requested county and state.                |
| **get\_industry\_insights**            | Pulls industry insights for a business using ChromaDB + Gemini embeddings.                  |
| **get\_metric\_value**                 | Returns the latest value of a chosen economic or demographic metric **[2]** for one county. |
| **get\_metric\_value\_trend**          | Provides the year-over-year trend of a metric **[2]** for a specific county.                |
| **get\_similar\_counties\_by\_metric** | Finds the 10 US counties most similar **[3]** to the target county on that metric.          |
| **show\_options**                      | Presents the user with selectable options                                                   |

*Notes:*

[1]: Currently the following metrics are supported: *Total Population*, *Gender: Male | Female*, *% Age 65+*

[2]: Currently the following metrics are supported: *Per capita income*, *Population* and *Unemployment rate*

[3]: Currently the only criterion, *Per capita income*, is used to fidn the similar counties

These tools are registered with the LangGraph agent, so the system can chain them together (often via the higher-level `analyze_market_opportunity` tool) to deliver a full, data-driven launch analysis workflow.
---

## 6. Deployment Guide (via Docker)

### Prerequisites

* Docker (integrated with Ubuntu) & docker-compose installed and WSL configured
* Optional: Git, Python 3.10+

### Step-by-Step

1. **Clone the repo**

   ```bash
   git clone https://github.com/NataliiaShevchenko620/LaunchWiseAI.git
   cd LaunchWiseAI
   ```

2. **Setup `.env` file**
   Copy example:

   ```bash
   cp .env.example .env
   ```

   * Set your database URI (e.g. `postgresql://user:pass@postgres:5432/launchwise`) and Postgres user and password
   * Configure API key for Gemini-2.0-flash, it can be obtained through Google AI Studio https://aistudio.google.com/app/apikey
   * Configure API key for Google Places API, it can be obtained through https://developers.google.com/maps/documentation/places/web-service/get-api-key 
   * Configure API key for Census API, it can be obtained through https://api.census.gov/data/key_signup.html 

    The rest of parameters can be left with their default values.

3. **Build and launch services**

   ```bash
   docker-compose up --build -d
   ```

   This creates service images, composes a Docker container and starts the following services:

   * `postgres` – PostgreSQL local database
   * `chroma` – Chroma local vector DB
   * `FastAPI` – LaunchWiseAI backend Python app based onb LangGraph/LangChain
   * `FastMCP` – MCP local server
   * `react` – LaunchWiseAI frontend React application

4. **Verify deployment**

   * Web API reachable at `http://localhost:3000/`

---

## 7. Next Steps
- Extend experts insights for different businesses in different locations
- Extend available statistics in Postgres DB (e.g. industry-specific wages in counties, average per capita spendings in states, etc.)
- Extend available statistics through Census tool
- Extend functionality of the Count competitors tool by considering Yelp statistics as well
- Improve precision of the Analyze market opportunity tool by considering more criteria when looking for similar counties and produce recommendation based not only on market saturation, but on other factors as well
- Integrate additional modules: competitor analysis, pricing suggestion
- Extend UI by providing multi-user and multi-conversation support

---

Made by Nataliia Shevchenko.
Licensed under [Apache‑2.0](LICENSE).

---
