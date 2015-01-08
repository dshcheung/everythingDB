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

    two_days_ago = Company.first.daily_quotes.where("volume > 0").order(:date).last(2).first.date

    daily_quotes ||= DailyQuote.where("volume > ? AND date >= ?", 0, two_days_ago).order(:company_id)
    
    companies ||= daily_quotes.select(:company_id).group(:company).having("count(*) > 1").count

    companies.each do |company, value|
      quotes = daily_quotes.where(:company_id => company.id).last(2)
      q1 = quotes[0]
      q2 = quotes[1]

      if check_gain(q1, q2, 0.1)
        @ten_or_more_percent << company
      elsif check_gain(q1, q2, 0.09)
        @nine_or_more_percent << company
      elsif check_gain(q1, q2, 0.08)
        @eight_or_more_percent << company
      elsif check_gain(q1, q2, 0.07)
        @seven_or_more_percent << company
      elsif check_gain(q1, q2, 0.06)
        @six_or_more_percent << company
      elsif check_gain(q1, q2, 0.05)
        @five_or_more_percent << company
      end
    end
  end

  def two_day_five_percent 
    @five_or_more_percent = []
    @six_or_more_percent = []
    @seven_or_more_percent = []
    @eight_or_more_percent = []
    @nine_or_more_percent = []
    @ten_or_more_percent = []

    three_days_ago = Company.first.daily_quotes.where("volume > 0").order(:date).last(3).first.date
    
    daily_quotes ||= DailyQuote.where("volume > ? AND date >= ?", 0, three_days_ago).order(:company_id)
    
    companies ||= daily_quotes.select(:company_id).group(:company).having("count(*) > 1").count

    companies.each do |company, value|
      quotes = daily_quotes.where(:company_id => company.id).last(3)
      q1 = quotes[0]
      q2 = quotes[1]
      q3 = quotes[2]

      if check_gain(q1, q2, 0.1) and check_gain(q2, q3, 0.1)
        @ten_or_more_percent << company
      elsif check_gain(q1, q2, 0.09) and check_gain(q2, q3, 0.09)
        @nine_or_more_percent << company
      elsif check_gain(q1, q2, 0.08) and check_gain(q2, q3, 0.08)
        @eight_or_more_percent << company
      elsif check_gain(q1, q2, 0.07) and check_gain(q2, q3, 0.07)
        @seven_or_more_percent << company
      elsif check_gain(q1, q2, 0.06) and check_gain(q2, q3, 0.06)
        @six_or_more_percent << company
      elsif check_gain(q1, q2, 0.05) and check_gain(q2, q3, 0.05)
        @five_or_more_percent << company
      end
    end
  end

  protected

    def check_gain(q1, q2, gain)
      # need to ensure volume is greater than 0 on that day
      return (q2.close - q1.close) / q1.close >= gain
    end
end
