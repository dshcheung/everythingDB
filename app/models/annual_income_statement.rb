class AnnualIncomeStatement < ActiveRecord::Base
  belongs_to :company

  validates_uniqueness_of :period, :scope => :company_id
end
