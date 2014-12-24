class Company < ActiveRecord::Base
  belongs_to :exchange
  has_many :daily_quotes

  validates_uniqueness_of :symbol, :scope => :company_id
end
