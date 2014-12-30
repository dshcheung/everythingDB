class DailyQuote < ActiveRecord::Base
  belongs_to :company

  validates_uniqueness_of :date, :scope => :company_id

  # scope :last_two_days, -> { where("date > ?", :two_days_ago) }

  # private

  #   def two_days_ago
  #     2.days.ago
  #   end
end
