# Use the official Postgres image
FROM postgres:15

# Copy in the dump; the official entrypoint will execute all *.sql here
COPY launchwise_dump.sql /docker-entrypoint-initdb.d/

# Expose the default Postgres port
EXPOSE 5432
