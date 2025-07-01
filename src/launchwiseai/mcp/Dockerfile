FROM python:3.12-slim

WORKDIR /app

# copy package metadata + source
COPY setup.py ./
COPY src/ ./src/

# install your package (and its dependencies)
RUN pip install --no-cache-dir .[mcp]

EXPOSE 8080

CMD ["python", "-m", "launchwiseai.mcp.server_tools"]