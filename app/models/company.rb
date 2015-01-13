class Company < ActiveRecord::Base
  belongs_to :exchange
  has_many :daily_quotes
  has_many :annual_income_statements

  validates_uniqueness_of :symbol, :scope => :exchange_id

  def to_param
    symbol
  end
end
