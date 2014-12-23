class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.decimal :mid
      t.decimal :bid
      t.decimal :ask
      t.decimal :last_price
      t.decimal :low
      t.decimal :high
      t.decimal :volume

      t.timestamps
    end
  end
end
