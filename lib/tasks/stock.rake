namespace :stock do
  desc "Get daily price for all SZ companies"
  task :daily => :environment do
	  require 'nokogiri'
	  require 'open-uri'
	  require 'csv'
    # CONN = ActiveRecord::Base.connection

    exchange = Exchange.find(1)
    exchange_symbol = exchange.symbol.downcase
    companies = exchange.companies.where(:status => nil)

    companies.find_each(:batch_size => 5) do |company|
      
      ActiveRecord::Base.transaction do
        if company.status == "in progress" or company.status == "done"
          next
        end

        company.update(:status => "in progress")
      end
      
      stock = company.symbol
      url = "http://table.finance.yahoo.com/table.csv?s=#{stock}.#{exchange_symbol}"

      data = open(url)
      data = CSV.parse(data)
      data = data[1..-1]

      data.each do |d|
        new_quote = company.daily_quotes.new

        new_quote.date = d[0]
        new_quote.open = d[1]
        new_quote.high = d[2]
        new_quote.low = d[3]
        new_quote.close = d[4]
        new_quote.volume = d[5]
        new_quote.adj_close = d[6]

        new_quote.save
      end

      company.update(:status => "done")

      puts "#{company.name} - Success"

      # company_id = company.id

      # data.each_slice(500) do |data_chunk|
      #   inserts = []
      #   data_chunk.each do |d|
      #     inserts.push "(#{company_id}, #{d[0]}, #{d[1]}, #{d[2]}, #{d[3]}, #{d[4]}, #{d[5]}, #{d[6]})"
      #   end
      #   sql = "INSERT INTO daily_quotes ('company_id', 'date', 'open', 'high', 'low', 'close', 'volume', 'adj_close') VALUES #{inserts.join(", ")}"
      #   CONN.execute sql
      # end
    end

  end

  desc "Get all SZ companies into database"
  task :sz => :environment do
    xls = Roo::Spreadsheet.open('http://dimsumcloud.s3.amazonaws.com/sz.xlsx')

    (2..xls.count).each do |i|
      new_company = Exchange.find(1).companies.new

      row = xls.row(i)
      new_company.symbol = row[0]
      new_company.name = row[1]

      if new_company.save
        puts "success"
      else
        puts "fail"
      end
    end

  end
end