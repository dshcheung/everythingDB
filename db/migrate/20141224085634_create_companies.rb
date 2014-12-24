class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :exchange_id
      t.string :symbol
      t.string :name

      t.timestamps
    end
  end
end
