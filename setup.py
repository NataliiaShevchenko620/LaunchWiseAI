from setuptools import setup, find_packages

setup(
    name="launchwiseai",
    version="0.1.0",
    package_dir={"": "src"},
    packages=find_packages(where="src"),
    install_requires=[
        "fastapi",
        "uvicorn[standard]",
        "langchain[community,google-genai]==0.3.23",
        "langgraph==0.4.5",
        "google-genai==1.7.0",
        "googlemaps==4.10.0",
        "mcp[cli]",
        "psycopg2-binary==2.9.10",
        "census==0.8.24",
        "us==3.2.0",
        "chromadb==0.6.3"
    ]
)