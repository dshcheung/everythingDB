json.array! @companies do |c|
  json.array! [c.symbol, c.name]
end