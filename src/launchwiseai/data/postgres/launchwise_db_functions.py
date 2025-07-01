import json
import psycopg2
from psycopg2 import sql
# Import connection function for Postgres DB
from launchwiseai.data.postgres.launchwise_db_conn import get_connection

class LaunchWiseDB:
    """
    Wrapper for staging and retrieving inline tool data and other data (in the future) in a SQLite database.
    """

    # Class initialization
    def __init__(self, conn_params=None, conversation_id: int = 1):
        self.conn_params = conn_params
        self.conversation_id = conversation_id

        # Create staging table if it does not exist
        query = sql.SQL(f"""
            CREATE TABLE IF NOT EXISTS staging.tool_data
            (
                conversation_id integer,
                tool_name varchar(255),
                inline_data text
            )
        """)

        conn = None

        try:
            # Create an auto-closing cursor
            with get_connection(self.conn_params) as conn:        
                with conn.cursor() as cursor:
                    # Initialize the staging table
                    cursor.execute(query)
                    
                    # Commit
                    conn.commit()

        except Exception as e:
            print(f"Database error: {str(e)}")
            return json.dumps({"error": f"Database error: {str(e)}"})
        finally:
            if conn:
                conn.close()
    
    # Add inline data
    def add_inline_data(self, tool_name, inline_data) -> None:
        """
        Stages inline data into the table
        """

        query = sql.SQL(f"""
            INSERT INTO staging.tool_data (conversation_id, tool_name, inline_data) VALUES (%s, %s, %s)
        """)

        conn = None

        try:
            # `with` will auto-commit (or rollback on exception) and close the connection
            with get_connection(self.conn_params) as conn:
                with conn.cursor() as cursor:
                    # Insert data
                    cursor.execute(
                        query,
                        (self.conversation_id, tool_name, str(inline_data))
                    )

                    # Commit
                    conn.commit()

        except Exception as e:
            print(f"Database error: {str(e)}")
            return json.dumps({"error": f"Database error: {str(e)}"})
        finally:
            if conn:
                conn.close()
    
    # Get inline data
    def get_inline_data(self) -> list[dict]:
        """
        Returns previosly staged inline data
        Now it returns all data per conversation at once, does not separate it by tools
        """

        query = sql.SQL(f"""
            SELECT inline_data FROM staging.tool_data WHERE conversation_id = %s
        """)

        conn = None

        try:
            # `with` will auto-commit (or rollback on exception) and close the connection
            with get_connection(self.conn_params) as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, (self.conversation_id,))                    
                    rows = cursor.fetchall()

        except Exception as e:
            print(f"Database error: {str(e)}")
            return json.dumps({"error": f"Database error: {str(e)}"})
        finally:
            if conn:
                conn.close()

        # Parse result
        inline_data = []

        for (blob, ) in rows:
            inline_data.append({"inline_data": {"data": str(blob)}})

        return inline_data

    # Clear inline data (after it is passed forward)
    def clear_inline_data(self) -> None:
        """
        Deletes staging data
        Now it deletes all data per conversation at once, does not separate it by tools
        """

        query = sql.SQL(f"""
            DELETE FROM staging.tool_data WHERE conversation_id = %s
        """)

        conn = None

        try:
            # `with` will auto-commit (or rollback on exception) and close the connection
            with get_connection(self.conn_params) as conn:
                with conn.cursor() as cursor:
                    cursor.execute(query, (self.conversation_id,))

                    # Commit
                    conn.commit()
            
        except Exception as e:
            print(f"Database error: {str(e)}")
            return json.dumps({"error": f"Database error: {str(e)}"})
        finally:
            if conn:
                conn.close()
