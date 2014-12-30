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

    one_day_ago = DailyQuote.where("volume > 0").order(:date).last.date

    @daily_quotes = DailyQuote.where("volume > 0").where("date >= ?", one_day_ago)

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
    @five_or_more_percent = Hash.new 0
    @six_or_more_percent = Hash.new 0
    @seven_or_more_percent = Hash.new 0
    @eight_or_more_percent = Hash.new 0
    @nine_or_more_percent = Hash.new 0
    @ten_or_more_percent = Hash.new 0

    two_days_ago = Company.first.daily_quotes.where("volume > 0").order(:date).last(2).first.date

    @daily_quotes = DailyQuote.where("volume > 0").where("date >= ?", two_days_ago)

    @daily_quotes.each do |q|
      if check_gain(q, 0.1)
        @ten_or_more_percent[q.company] += 1
      end

      if check_gain(q, 0.09)
        @nine_or_more_percent[q.company] += 1
      end

      if check_gain(q, 0.08)
        @eight_or_more_percent[q.company] += 1
      end

      if check_gain(q, 0.07)
        @seven_or_more_percent[q.company] += 1
      end

      if check_gain(q, 0.06)
        @six_or_more_percent[q.company] += 1
      end

      if check_gain(q, 0.05)
        @five_or_more_percent[q.company] += 1
      end
    end

    @ten_or_more_percent = @ten_or_more_percent.select{ |k, v| v > 1 }.keys
    @nine_or_more_percent = @nine_or_more_percent.select{ |k, v| v > 1 }.keys
    @eight_or_more_percent = @eight_or_more_percent.select{ |k, v| v > 1 }.keys
    @seven_or_more_percent = @seven_or_more_percent.select{ |k, v| v > 1 }.keys
    @six_or_more_percent = @six_or_more_percent.select{ |k, v| v > 1 }.keys
    @five_or_more_percent = @five_or_more_percent.select{ |k, v| v > 1 }.keys

  end

  protected

    def check_gain(quote, gain)
      # need to ensure volume is greater than 0 on that day
      return (quote.close - quote.open) / quote.open >= gain && quote.volume > 0
    end
end
