class CreateDailyQuotes < ActiveRecord::Migration
  def change
    create_table :daily_quotes do |t|
      t.datetime :date
      t.decimal :open
      t.decimal :high
      t.decimal :low
      t.decimal :close
      t.integer :volume
      t.decimal :adj_close

      t.integer :daily_quotable_id

      t.timestamps
    end
  end
end
