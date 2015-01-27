## everythingDB


### FlightRadar24

After migrating the db, run these commands to scrape the data:

        $ rake scrape_flights:get_airlines
        $ rake scrape_flights:get_planes_codes
        $ rake scrape_flights:get_planes_data

This is only currently getting the list of airlaines, their active airplanes and the basic information for these planes.

##### TODO/Missing from FlightRadar24:

* Change flight_radar_url to a simplified one (DRY DB)
* List of airports (scrape by country?)
* Last flights information for each airplane