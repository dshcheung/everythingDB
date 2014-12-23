json.array! @tickers do |ticker|
  json.x ticker.created_at.to_i * 1000
  json.y ticker.last_price.to_f
end