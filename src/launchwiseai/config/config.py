import os

# Assigning keys for Google, Census and Google Places APIs
GOOGLE_API_KEY = os.getenv("GOOGLE_API_KEY")
CENSUS_API_KEY = os.getenv("CENSUS_API_KEY")
GPLACES_API_KEY = os.getenv("GPLACES_API_KEY")

# Connection params to Postgres DB
LaunchWiseDB_conn_params = {
    "host": "postgres",
    "port": 5432,
    "dbname": "LaunchWiseDB",
    "user": "postgres",
    "password": os.getenv("POSTGRES_PASSWORD"),
    "connect_timeout": 60,
    "sslmode": "prefer"
}