module Api
  module V1
    class DailyQuotesController < ApplicationController
      def show
        company = Company.find(params[:id])
        @daily_quotes = company.daily_quotes.order(:date)
      end
    end
  end
end
