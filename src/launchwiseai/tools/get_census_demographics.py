from launchwiseai.config.config import CENSUS_API_KEY
from census import Census
import us

def get_census_demographics(county_name: str, state_name: str) -> str:
    """Retrieve U.S. Census demographics for the given county and state."""
    
    # Initialize the Census API client
    c = Census(CENSUS_API_KEY)
    
    # Get FIPS code for the state
    state_fips = us.states.lookup(state_name).fips
    
    # Retrieve county data
    county_data = c.sf1.state_county(("NAME",), state_fips, "*")
    county_info = next((ct for ct in county_data if county_name.lower() in ct["NAME"].lower()), None)
    
    if not county_info:
        return f"County '{county_name}' not found in '{state_name}'"
    
    county_fips = county_info["county"]
    
    # Retrieve demographic data from the ACS5 API
    data = c.acs5.state_county((
        "B01003_001E",  # Total population.
        "B01001_002E",  # Total Male.
        "B01001_026E",  # Total Female.
        "B01001_020E",  # Age 65+.
    ), state_fips, county_fips)[0]
    
    total_pop = int(data["B01003_001E"])
    male = int(data["B01001_002E"])
    female = int(data["B01001_026E"])
    senior = int(data["B01001_020E"])
    
    return (
        f"{county_name}, {state_name} Census Demographics:\n\n"
        f"- Total Population: {total_pop:,}\n"
        f"- Gender: {male:,} Male | {female:,} Female\n"
        f"- % Age 65+: {round(senior / total_pop * 100, 1)}%\n"
    )