json.array! @daily_quotes do |q|
  json.array! [q.date.to_i * 1000, q.open.to_f.round(2), q.high.to_f.round(2), q.low.to_f.round(2), q.close.to_f.round(2), q.volume.to_f.round(2)]
end