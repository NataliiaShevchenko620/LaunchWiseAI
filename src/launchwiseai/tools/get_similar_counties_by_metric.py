import json
from psycopg2 import sql
# Import connection function for Postgres DB
from launchwiseai.data.postgres.launchwise_db_conn import get_connection

def get_similar_counties_by_metric(county_name: str, state_name: str, metric_name: str) -> str:
    """
    Finds the top 5 counties in the US with the most similar metric value to the given county.
    Similarity means that the metric is between 90% and 110% of the current county's metric.

    Args:
        county_name (str): County name without the word "county" (e.g., 'Hudson').
        state_name (str): Full state name (e.g., 'New Jersey').
        metric_name (str): One of: "Per capita income", "Population", "Unemployment rate".

    Returns:
        str: JSON string with list of similar counties or an error message.
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

    metric_query = metric_query_map[metric_name_clean]

    query = sql.SQL(f"""
        WITH CurrentCounty AS (
            SELECT {metric_query}
            FROM statistics.county_metric cm
            JOIN statistics.county c ON c.county_fips = cm.county_fips
            JOIN statistics.state s ON s.state_code = c.state_code
            WHERE c.county_name = %s
              AND s.state_name = %s
              AND cm.year = (SELECT MAX(year) FROM statistics.county_metric)
        ),
        AllCounties AS (
            SELECT c.county_name,
                   s.state_name,
                   {metric_query}
            FROM statistics.county_metric cm
            JOIN statistics.county c ON c.county_fips = cm.county_fips
            JOIN statistics.state s ON s.state_code = c.state_code
            WHERE cm.year = (SELECT MAX(year) FROM statistics.county_metric)
              AND NOT (c.county_name = %s AND s.state_name = %s)
        )
        SELECT ac.county_name,
               ac.state_name,
               ac.metric_value
        FROM AllCounties ac
        CROSS JOIN CurrentCounty cc
        WHERE ac.metric_value BETWEEN cc.metric_value * 0.90 AND cc.metric_value * 1.10
        ORDER BY ABS(ac.metric_value - cc.metric_value)
        LIMIT 5
    """)

    conn = None

    try:
        # Create connection
        conn = get_connection()

        # Create an auto-closing cursor
        with conn:        
            with conn.cursor() as cursor:
                # Execute query
                cursor.execute(query, (county_name, state_name, county_name, state_name))
                rows = cursor.fetchall()

        if rows:
            return json.dumps({
                "reference_county": f"{county_name}, {state_name}",
                "metric": metric_name,
                "similar_counties": rows
            })
        else:
            return json.dumps({
                "warning": f"No similar counties found for {metric_name} near {county_name}, {state_name}"
            })

    except Exception as e:
        print(f"Database error: {str(e)}")

        return json.dumps({
            "error": f"Database error: {str(e)}"
        })
    finally:
        if conn:
            conn.close()
