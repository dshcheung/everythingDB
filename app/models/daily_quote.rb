class DailyQuote < ActiveRecord::Base
  belongs_to :daily_quotable, :polymorphic => true

  validates_uniqueness_of :date, :scope => :daily_quotable_id
end
