namespace :stock do
  desc "Get daily price for all SZ companies"
  task :daily => :environment do
	  require 'nokogiri'
	  require 'open-uri'
	  require 'csv'
    # CONN = ActiveRecord::Base.connection

    exchange = Exchange.find(1)
    exchange_symbol = exchange.symbol.downcase
    companies = exchange.companies

    companies.find_each(:batch_size => 5) do |company|
      stock = company.symbol
      url = "http://table.finance.yahoo.com/table.csv?s=#{stock}.#{exchange_symbol}"

      catch (:done)  do
        ActiveRecord::Base.transaction do
          case company.status
          when "in progress", "done", "no data"
            puts "#{company.name} is already in progress or done or no data"
            throw :done
          else
            company.update(:status => "in progress")
            puts "#{company.name} started scraping"
          end
        end

        begin
          data = open(url)
          data = CSV.parse(data)
          data = data[1..-1]

          latest_date = company.daily_quotes.order(:date).last.date

          i = 0
          data.each do |d|
            if d[0].to_datetime > latest_date
              i += 1
            end
          end

          if i == 0
            puts "#{company.name} is already up to date"
            company.update(:status => "done")
            throw :done
          else
            data = data[0..i-1]
          end

        rescue
          puts  "Cannot find data for #{company.name}"
          company.update(:status => "no data")
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

        ActiveRecord::Base.transaction do
          company.update(:status => "done")
          puts "#{company.name} - Success"
        end
      end
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