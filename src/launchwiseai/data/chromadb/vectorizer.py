from google import genai
from google.api_core import retry
from google.genai import types
from chromadb import EmbeddingFunction, Documents, Embeddings
from launchwiseai.config.config import GOOGLE_API_KEY

client = genai.Client(api_key=GOOGLE_API_KEY)

# Define a helper to retry when quota is exceeded
is_retriable = lambda e: isinstance(e, genai.errors.APIError) and e.code in {429, 503}

class GeminiEmbeddingFunction(EmbeddingFunction):
    def __init__(self, document_mode=True):
        self.document_mode = document_mode

    @retry.Retry(predicate=is_retriable)
    def __call__(self, input: Documents) -> Embeddings:
        task = "retrieval_document" if self.document_mode else "retrieval_query"
        response = client.models.embed_content(
            model="models/text-embedding-004",
            contents=input,
            config=types.EmbedContentConfig(task_type=task),
        )

        return [e.values for e in response.embeddings]