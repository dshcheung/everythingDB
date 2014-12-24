json.array! @daily_quotes do |q|
  json.x q.date.to_i * 1000
  json.y q.adj_close.to_f
end