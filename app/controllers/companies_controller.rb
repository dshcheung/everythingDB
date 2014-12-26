class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])

    gon.company = @company

    # TODO: biggest 3 historical spread (datetime, spread, volume)
    matching_quotes = []
    @connected_quote_arr = []
    temp_quote_arr = []

    @company.daily_quotes.each do |quote|
      if (quote.close - quote.open) / quote.open >= 0.05
        matching_quotes << quote
      end
    end

    matching_quotes.each_with_index do |date, index|
      if index == matching_quotes.length - 1
        return
      end

      if matching_quotes[index].date + 1.day == matching_quotes[index+1].date
        if temp_quote_arr == []
          temp_quote_arr << matching_quotes[index]
          temp_quote_arr << matching_quotes[index+1]
        else
          temp_quote_arr << matching_quotes[index+1]
        end
      else
        @connected_quote_arr << temp_quote_arr if temp_quote_arr.any?
        temp_quote_arr = []
      end
    end

    @connected_quote_arr
  end
end
