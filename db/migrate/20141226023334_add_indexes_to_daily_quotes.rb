class AddIndexesToDailyQuotes < ActiveRecord::Migration
  def change
    add_index :daily_quotes, :date
    add_index :daily_quotes, :daily_quotable_id
    add_index :daily_quotes, [:daily_quotable_id, :date]
  end
end
