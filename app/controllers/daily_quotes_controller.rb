class DailyQuotesController < ApplicationController
  def show
  	company = Company.find(params[:id])
    @daily_quotes = company.daily_quotes.order(:date).last(900)
  end
end
