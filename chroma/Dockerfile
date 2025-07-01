FROM ghcr.io/chroma-core/chroma:latest

# Install curl so healthchecks work
USER root
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Switch to the default Chroma DB data directory
WORKDIR /data

# Copy in your precomputed index
COPY chroma_db/ /data

# Expose the usual port
EXPOSE 8000

# (inherits ENTRYPOINT/CMD from the base image)
