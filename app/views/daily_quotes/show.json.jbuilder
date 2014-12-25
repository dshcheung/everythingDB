json.array! @daily_quotes do |q|
  json.array! [q.date.to_i * 1000, q.open.to_f, q.high.to_f, q.low.to_f, q.close.to_f, q.volume.to_f]
end