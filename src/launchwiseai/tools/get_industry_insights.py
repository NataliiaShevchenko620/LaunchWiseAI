import os
from chromadb import PersistentClient
from launchwiseai.data.chromadb.vectorizer import GeminiEmbeddingFunction
from launchwiseai.llm.model_router import call_llm_model_with_tools

DB_NAME = "industry_insights"

# Set paths
# First check if the path is defined in the environment variable
chromadb_path = os.getenv("CHROMA_DATA_PATH")

if chromadb_path is None:
    # for local dev only: fall back to host-relative path
    base_dir      = os.path.dirname(os.path.abspath(__file__))
    chromadb_path = os.path.normpath(
        os.path.join(base_dir, "..", "..", "..", "chroma_db")
    )

def get_industry_insights(business: str) -> str:
    """
    Retrieve industry insights for a given business using ChromaDB and Gemini.

    Args:
        business (str): The business name for querying internal evaluation guidelines.

    Returns:
        str: A summarized string of insights or an error message.
    """
    try:
        # Initialize the embedding function and set document mode off for query mode.
        embed_fn = GeminiEmbeddingFunction()
        embed_fn.document_mode = False

        # Create or retrieve the ChromaDB collection.
        # chroma_client = chromadb.Client()
        chroma_client = PersistentClient(path=chromadb_path)
        db = chroma_client.get_or_create_collection(name=DB_NAME, embedding_function=embed_fn)

        # Query internal evaluation guidelines.
        query_text = f"Evaluation rules for {business} business"

        result = db.query(query_texts=[query_text], n_results=1)

        documents = result.get("documents", [])

        if not documents or not documents[0]:
            return f"No insights found in ChromaDB for business: {business}"
        
        all_passages = documents[0]

        # Build a summarization prompt from the retrieved passages.
        summarization_query = (
            "Analyze the insights document and retrieve values of quantitative metrics that can be used in subsequent analysis. "
            "Return the answer as key-value pairs where keys are metric names and values are metric conditions (use a short style). "
            "Include only these metric names: 'Per capita income', 'Population', 'Unemployment rate', 'Annual establishments', "
            "'Annual employment', 'Average annual wage', 'Industry share'. "
            "If an industry is mentioned, include it as 'Industry': '<Industry name>' using one of these: "
            "'National resources and mining', 'Construction', 'Manufacturing', 'Trade, transportation, and utilities', "
            "'Information', 'Financial activities', 'Professional and business services', 'Leisure and hospitality', 'Public administration'."
        )
        # Flatten the prompt text to remove newlines.
        summarization_query_oneline = " ".join(summarization_query.split())

        prompt = f"QUESTION: {summarization_query_oneline}\n"
        
        for passage in all_passages:
            passage_oneline = " ".join(passage.split())
            prompt += f"PASSAGE: {passage_oneline}\n"

        # Build MCP-style input
        contents = [
            {
                "role": "system",
                "parts": [
                    {
                        "text": (
                            "You are an industry-insights extraction assistant. "
                            "Your task is to analyze the provided passages and extract quantitative metrics "
                            "as concise key-value pairs. Include only the metrics: "
                            "'Per capita income', 'Population', 'Unemployment rate', 'Annual establishments', "
                            "'Annual employment', 'Average annual wage', and 'Industry share'. "
                            "If an industry appears, output it as 'Industry': '<Industry name>' using one of the predefined categories. "
                            "Respond with only the key-value pairs, without any additional explanation or source text."
                        )
                    }
                ]
            },
            {"role": "user", "parts": [{"text": prompt}]}
        ]

        # Select model
        model_choice = "gemini-2.0-flash"

        # Call model using MCP-compatible wrapper
        response = call_llm_model_with_tools(
            model_name=model_choice,
            contents=contents,
            tools=[]
        )

        return str(response)
    
    except Exception as e:
        print(f"get_industry_insights error: {e}")
        return f"Error accessing ChromaDB: {str(e)}"