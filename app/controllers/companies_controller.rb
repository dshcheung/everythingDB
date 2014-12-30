class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by_symbol(params[:id])

    gon.company = @company

    # TODO: biggest 3 historical spread (datetime, spread, volume)
    @connected_quote_arr = []
    temp_quote_arr = []
    all_quotes = @company.daily_quotes.where("volume > 0").order(:date)

    if all_quotes.any?
      all_quotes.each_with_index do |quote, index|
        if index == all_quotes.length - 1
          @connected_quote_arr << temp_quote_arr if temp_quote_arr.any?
          return
        end

        todays_quote = all_quotes[index]
        tmrs_quote = all_quotes[index+1]

        if check_gain(todays_quote) and check_gain(tmrs_quote)
          if temp_quote_arr == []
            temp_quote_arr << all_quotes[index]
            temp_quote_arr << all_quotes[index+1]
          else
            temp_quote_arr << all_quotes[index+1]
          end
        else
          @connected_quote_arr << temp_quote_arr if temp_quote_arr.any?
          temp_quote_arr = []
        end
      end

    end
  end

  protected

  def check_gain(quote)
    # need to ensure volume is greater than 0 on that day
    percentage = params[:percentage] || 0.05
    return (quote.close - quote.open) / quote.open >= percentage.to_d && quote.volume > 0
  end
end
