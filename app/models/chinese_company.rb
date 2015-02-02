class ChineseCompany < ActiveRecord::Base
  belongs_to :exchange
  has_many :daily_quotes, :as => :daily_quotable 
  has_many :chinese_annual_incomes

  validates_uniqueness_of :symbol, :scope => :exchange_id

  def to_param
    symbol
  end
end
