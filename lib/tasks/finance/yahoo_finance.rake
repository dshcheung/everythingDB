namespace :yahoo_finance do
  desc "Get daily price for all SZ companies"
  task :daily_quotes => :environment do
	  require 'nokogiri'
	  require 'open-uri'
	  require 'csv'

    exchange = Exchange.find(2)
    exchange_symbol = exchange.symbol.downcase
    companies = exchange.chinese_companies

    companies.find_each(:batch_size => 5) do |company|
      stock = company.symbol
      url = "http://table.finance.yahoo.com/table.csv?s=#{stock}.#{exchange_symbol}"

      catch (:done) do
        begin
          data = open(url)
          data = CSV.parse(data)
          data = data[1..-1]

          if company.daily_quotes.count > 0
            latest_date = company.daily_quotes.order(:date).last.date
            
            i = 0
            data.each do |d|
              if d[0].to_datetime > latest_date
                i += 1
              end
            end

            if i == 0
              puts "#{company.call_name} is already up to date"
              throw :done
            else
              data = data[0..i-1]
            end
          end

        rescue
          puts  "Cannot find data for #{company.call_name}"
          throw :done
        end

        puts "There are #{data.count} data points"

        data.each do |d|
          new_quote = company.daily_quotes.new

          new_quote.date = d[0]
          new_quote.open = d[1]
          new_quote.high = d[2]
          new_quote.low = d[3]
          new_quote.close = d[4]
          new_quote.volume = d[5]
          new_quote.adj_close = d[6]

          if new_quote.save
            print "."
          else
            print "x"
          end
        end

        puts "#{company.call_name} - Success"
      end
    end
  end
end