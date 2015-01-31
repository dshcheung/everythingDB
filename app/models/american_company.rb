class AmericanCompany < ActiveRecord::Base
  belongs_to :exchange
  has_many :daily_quotes, :as => :daily_quotable 

  validates_uniqueness_of :symbol, :scope => :exchange_id

  def to_param
    symbol
  end
end
