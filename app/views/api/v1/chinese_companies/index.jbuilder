json.companies @companies do |company|
  json.name company.call_name
  json.symbol company.symbol
end