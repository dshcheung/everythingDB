json.airplanes @airplanes do |airplane|
  json.registration_code airplane.registration_code
  json.mode_s airplane.mode_s
  json.plane_type_code airplane.plane_type_code
  json.plane_type airplane.plane_type
  json.s_n airplane.s_n
  json.link url_for(api_v1_airplane_path(airplane.airline.icao, airplane.registration_code))
end