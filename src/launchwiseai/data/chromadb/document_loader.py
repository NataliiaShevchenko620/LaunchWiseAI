import os

def load_documents_from_folder(folder_path: str):
    documents, ids = [], []
    for filename in os.listdir(folder_path):
        if filename.endswith(".txt"):
            filepath = os.path.join(folder_path, filename)
            with open(filepath, "r", encoding="utf-8") as f:
                content = f.read()
                documents.append(content)
                ids.append(filename.replace(".txt", ""))
    return documents, ids