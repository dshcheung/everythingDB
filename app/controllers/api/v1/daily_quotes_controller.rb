module Api
  module V1
    class DailyQuotesController < ApplicationController
      def index
        company = ChineseCompany.find_by_symbol(params[:chinese_company_id])
        @daily_quotes = company.daily_quotes.order(:date)
      end
    end
  end
end
