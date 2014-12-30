class StaticPagesController < ApplicationController
  def index
    
  end

  def daily_five_percent 
    @five_or_more_percent = []
    @six_or_more_percent = []
    @seven_or_more_percent = []
    @eight_or_more_percent = []
    @nine_or_more_percent = []
    @ten_or_more_percent = []

    one_day_ago = DailyQuote.order(:date).last.date

    @daily_quotes = DailyQuote.where("date = ?", one_day_ago)

    @daily_quotes.each do |q|
      if check_gain(q, 0.1)
        @ten_or_more_percent << q
      elsif check_gain(q, 0.09)
        @nine_or_more_percent << q
      elsif check_gain(q, 0.08)
        @eight_or_more_percent << q
      elsif check_gain(q, 0.07)
        @seven_or_more_percent << q
      elsif check_gain(q, 0.06)
        @six_or_more_percent << q
      elsif check_gain(q, 0.05)
        @five_or_more_percent << q
      end
    end
  end

  def two_day_five_percent 
    two_days_ago = Company.first.daily_quotes.order(:date).last(2).first.date
  end

  protected

    def check_gain(quote, gain)
      # need to ensure volume is greater than 0 on that day
      return (quote.close - quote.open) / quote.open >= gain && quote.volume > 0
    end
end
