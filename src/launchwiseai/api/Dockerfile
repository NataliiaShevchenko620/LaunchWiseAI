FROM python:3.12-slim

WORKDIR /app

# copy package metadata + source
COPY setup.py ./
COPY src/ ./src/

# install your package (and its dependencies)
RUN pip install --no-cache-dir .

EXPOSE 8000

CMD ["uvicorn", "launchwiseai.api.main:app", "--host", "0.0.0.0", "--port", "8000"]