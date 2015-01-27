json.airlines [@airline] do |airline|
  json.name airline.name
  json.icao airline.icao
  json.iata airline.iata
  json.flight_radar_url airline.flight_radar_url
end