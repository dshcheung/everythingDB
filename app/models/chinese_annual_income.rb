class ChineseAnnualIncome < ActiveRecord::Base
  belongs_to :chinese_company

  validates_uniqueness_of :period, :scope => :chinese_company_id
end
