import psycopg2
# Import connection params to Postgres DB
from launchwiseai.config.config import LaunchWiseDB_conn_params

# Establish connection to the database
def get_connection(conn_params = None):
    # Check passed connection parameters
    if conn_params is None:
        # Set pre-configured ones
        conn_params = LaunchWiseDB_conn_params

    return psycopg2.connect(**conn_params)
