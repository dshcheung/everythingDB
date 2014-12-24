namespace :stock do
  desc "Get daily price for all SZ companies"
  task :daily => :environment do
	  require 'nokogiri'
	  require 'open-uri'
	  require 'csv'

    exchange = 'sz'
    stock = '000001'
    url = "http://table.finance.yahoo.com/table.csv?s=#{stock}.#{exchange}"

    data = open(url)
    data = CSV.parse(data)

    data.each do |d|
      new_quote = DailyQuote.new

      new_quote.date = d[0]
      new_quote.open = d[1]
      new_quote.high = d[2]
      new_quote.low = d[3]
      new_quote.close = d[4]
      new_quote.volume = d[5]
      new_quote.adj_close = d[6]

      if new_quote.save
        puts "success"
      else
        puts "fail"
      end
    end

  end
end