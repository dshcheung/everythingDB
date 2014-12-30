Company.find_each(:batch_size => 5).each do |company|
  quotes = company.daily_quotes

  quotes.group(:date).having("count(*) > 1").count.each do |q|
    date = q[0]
    
    to_be_deleted_q = quotes.find_by_date(date)
    
    to_be_deleted_q.destroy
    puts to_be_deleted_q
  end
end
