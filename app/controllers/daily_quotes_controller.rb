class DailyQuotesController < ApplicationController
  def index
    @quotes = DailyQuote.all
  end
end
