json.airlines @airlines do |airline|
  json.name airline.name
  json.icao airline.icao
  json.iata airline.iata
  json.number_of_airplanes airline.airplanes.count
  json.flight_radar_url airline.flight_radar_url
  json.link url_for(api_v1_airline_path(airline.icao))
end