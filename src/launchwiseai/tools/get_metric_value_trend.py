import json
from psycopg2 import sql
# Import connection function for Postgres DB
from launchwiseai.data.postgres.launchwise_db_conn import get_connection

def get_metric_value_trend(county_name: str, state_name: str, metric_name: str) -> str:
    """
    Returns the trend by years of a given metric for a specific county.

    Args:
        county_name (str): County name without the word "county" (e.g., 'Hudson').
        state_name (str): Full state name (e.g., 'New Jersey').
        metric_name (str): One of the pre-defined metrics - 
            "Per capita income", "Population", "Unemployment rate".

    Returns:
        str: JSON string with list of (metric_value, year) or error message.
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
        SELECT {metric_query}, cm.year
        FROM statistics.county_metric cm
        JOIN statistics.county c ON c.county_fips = cm.county_fips
        JOIN statistics.state s ON s.state_code = c.state_code
        WHERE c.county_name = %s AND s.state_name = %s
        ORDER BY cm.year
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
                rows = cursor.fetchall()

        if rows:
            return json.dumps({
                "county": county_name,
                "state": state_name,
                "metric": metric_name,
                "trend": rows
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
