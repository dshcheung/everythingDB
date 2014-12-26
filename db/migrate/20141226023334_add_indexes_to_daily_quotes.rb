class AddIndexesToDailyQuotes < ActiveRecord::Migration
  def change
    add_index :daily_quotes, :date
    add_index :daily_quotes, :company_id
    add_index :daily_quotes, [:company_id, :date]
  end
end
