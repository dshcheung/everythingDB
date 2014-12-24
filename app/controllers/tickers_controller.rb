class TickersController < ApplicationController
  def index
    @tickers = Ticker.all.last(900)
  end
end
