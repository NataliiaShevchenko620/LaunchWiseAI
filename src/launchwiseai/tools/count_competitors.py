import json
import time
import googlemaps
from launchwiseai.config.config import GPLACES_API_KEY

def count_competitors(business: str, location: str) -> str:
    """
    Uses Google Places API to count businesses in a given industry and county.
    Helps determine how saturated the market is.

    Args:
        business (str): Type of business (e.g., 'cleaning', 'coffee shop').
        location (str): County and state (e.g., 'Hudson County, New Jersey').

    Returns:
        str: JSON-formatted result with competitor count or error message.
    """

    api_key = GPLACES_API_KEY
    if not api_key:
        return json.dumps({"error": "Google Places API key not found in environment variables."})

    gmaps = googlemaps.Client(key=api_key)

    query = f"{business} services in {location}"

    try:
        result = gmaps.places(query=query)
        total = len(result.get("results", []))

        # Check for additional pages
        while "next_page_token" in result:
            time.sleep(2)  # Delay required by Google API
            result = gmaps.places(query=query, page_token=result["next_page_token"])
            total += len(result.get("results", []))

        return json.dumps({
            "business": business,
            "location": location,
            "estimated_competitors": total
        })

    except Exception as e:
        return json.dumps({
            "error": f"Google Places API error: {str(e)}",
            "business": business,
            "location": location
        })
