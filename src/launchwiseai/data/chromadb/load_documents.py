import os
from chromadb import PersistentClient
from launchwiseai.data.chromadb.vectorizer import GeminiEmbeddingFunction
from launchwiseai.data.chromadb.document_loader import load_documents_from_folder

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

resources_path = os.path.normpath(os.path.join(base_dir, "..",  "..", "..", "..", "resources", "industry_insights"))

# Load documents
documents, ids = load_documents_from_folder(resources_path)
print(f"Read {len(documents)} documents from '{resources_path}'")

# Prepare vector store
embed_fn = GeminiEmbeddingFunction()
embed_fn.document_mode = True

client = PersistentClient(path=chromadb_path)
collection = client.get_or_create_collection(
    name=DB_NAME,
    embedding_function=embed_fn
)

# Remove existing data
existing = collection.get()
existing_ids = existing.get("ids", [])
if existing_ids:
    collection.delete(ids=existing_ids)
    print(f"Removed {len(existing_ids)} existing documents")

# Upload new data
if documents and ids:
    collection.add(documents=documents, ids=ids)
    print(f"Uploaded {collection.count()} documents to ChromaDB.")
else:
    print("No documents found to upload.")