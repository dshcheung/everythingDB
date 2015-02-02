module Api
  module V1
    class ChineseCompaniesController < ApplicationController
      def index
        @companies = ChineseCompany.all
      end

      def show
        @company = ChineseCompany.find_by_symbol(params[:id])
        # @annual_income_statements = @company.annual_income_statements
        
        # # TODO: biggest 3 historical spread (datetime, spread, volume)
        # @connected_quote_arr = []
        # temp_quote_arr = []
        # all_quotes = @company.daily_quotes.where("volume > 0").order(:date)

        # if all_quotes.any?
        #   all_quotes.each_with_index do |quote, index|
        #     if index == all_quotes.length - 2
        #       @connected_quote_arr << temp_quote_arr if temp_quote_arr.any?
        #       return
        #     end

        #     q1 = all_quotes[index]
        #     q2 = all_quotes[index+1]
        #     q3 = all_quotes[index+2]

        #     if check_gain(q1, q2) and check_gain(q2, q3)
        #       if temp_quote_arr == []
        #         temp_quote_arr << q1
        #         temp_quote_arr << q2
        #         temp_quote_arr << q3
        #       else
        #         temp_quote_arr << q3
        #       end
        #     else
        #       @connected_quote_arr << temp_quote_arr if temp_quote_arr.any?
        #       temp_quote_arr = []
        #     end
        #   end
        # end
      end

      protected

      def check_gain(q1, q2)
        # need to ensure volume is greater than 0 on that day
        percentage = params[:percentage] || 0.05
        return (q2.close - q1.close) / q1.close >= percentage.to_d
      end
    end
  end
end