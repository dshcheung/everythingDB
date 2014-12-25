json.array! @tickers do |ticker|
  json.array! [ticker.created_at.to_i * 1000, ticker.last_price.to_f]
end