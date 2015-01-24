class TickersController < ApplicationController
  def index
    @tickers = Ticker.order(:created_at).last(1000)
  end
end
