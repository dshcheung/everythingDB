json.companies @companies do |company|
  json.name company.name
  json.symbol company.symbol
  json.link company_path(company)
end