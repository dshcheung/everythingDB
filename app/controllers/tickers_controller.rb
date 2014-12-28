class TickersController < ApplicationController
  def index
    @tickers = Ticker.order(:created_at)
  end
end
