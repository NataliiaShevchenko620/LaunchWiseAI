import json
from psycopg2 import sql
# Import connection function for Postgres DB
from launchwiseai.data.postgres.launchwise_db_conn import get_connection

def get_metric_value(county_name: str, state_name: str, metric_name: str) -> str:
    """
    Returns the latest value of a given metric in a specific county.

    Args:
        county_name (str): Name of the county (e.g., 'Hudson'), without the word 'county'.
        state_name (str): Full state name (e.g., 'New Jersey').
        metric_name (str): Metric name - must be one of:
            "Per capita income", "Population", or "Unemployment rate".

    Returns:
        str: JSON-formatted string with the result or error message.
    """

    allowed_metrics = ["Per capita income", "Population", "Unemployment rate"]
    metric_name_clean = metric_name.lower()

    if metric_name_clean not in [m.lower() for m in allowed_metrics]:
        return json.dumps({
            "error": f"Unsupported metric. Choose one of: {allowed_metrics}"
        })

    metric_query_map = {
        "per capita income": "cm.bea_total_income / cm.population AS metric_value",
        "population": "cm.population AS metric_value",
        "unemployment rate": "100 * (1 - CAST(cm.bls_employed AS float) / CAST(cm.bls_labor_force AS float)) AS metric_value"
    }

    metric_query = metric_query_map.get(metric_name_clean)

    query = sql.SQL(f"""
        SELECT {metric_query}
        FROM statistics.county_metric cm
        JOIN statistics.county c ON c.county_fips = cm.county_fips
        JOIN statistics.state s ON s.state_code = c.state_code
        WHERE c.county_name = %s AND s.state_name = %s
        AND cm.year = (SELECT MAX(year) FROM statistics.county_metric)
    """)

    conn = None

    try:
        # Create connection
        conn = get_connection()

        # Create an auto-closing cursor
        with conn:        
            with conn.cursor() as cursor:
                # Execute query
                cursor.execute(query, (county_name, state_name))
                row = cursor.fetchone()

        if row:
            return json.dumps({
                "county": county_name,
                "state": state_name,
                "metric": metric_name,
                "latest_value": row[0]
            })
        else:
            return json.dumps({
                "warning": f"No data found for {metric_name} in {county_name}, {state_name}"
            })

    except Exception as e:
        print(f"Database error: {str(e)}")

        return json.dumps({
            "error": f"Database error: {str(e)}"
        })
    finally:
        if conn:
            conn.close()