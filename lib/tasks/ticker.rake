namespace :ticker do
  desc "Get Bitfinex Ticker Price"
  task :bitfinex => :environment do
    require 'json'

    while true
      url = 'https://api.bitfinex.com/v1/pubticker/btcusd'

      document = HTTParty.get(url)

      data = JSON.parse(document.body)
      data.delete('timestamp')

      ticker = Ticker.new(data)
      
      if ticker.save
        puts ticker
        PrivatePub.publish_to "/tickers/new", :message => { timestamp: ticker.created_at.to_i * 1000, last_price: ticker.last_price.to_f, mid: ticker.mid.to_f, bid: ticker.bid.to_f, ask: ticker.ask.to_f }
      else
        puts "failed"
      end

      sleep 15
    end

  end
end