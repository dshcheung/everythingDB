class CreateAmericanCompanies < ActiveRecord::Migration
  def change
    create_table :american_companies do |t|
      # basic identification information
      t.integer :exchange_id
      t.string :symbol
      t.string :english_name
      t.string :chinese_name
      t.text :location
      t.datetime :ipo_date
      
      t.timestamps
    end
  end
end
