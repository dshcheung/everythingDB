json.array! @tickers do |q|
  json.array! [q.created_at.to_i * 1000, q.last_price.to_f.round(2), q.mid.to_f.round(2), q.bid.to_f.round(2), q.ask.to_f.round(2)]
end