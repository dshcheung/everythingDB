class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :title
      t.text :address
      t.string :phonenumber
      t.string :pricerange
      t.text :tags
      t.text :acceptedpayment
      t.integer :seating
      t.text :intro
      t.text :description

      t.string :district_id
      t.string :cuisine_id
      
      t.timestamps
    end

    add_index :restaurants, :district_id
    add_index :restaurants, :cuisine_id
    add_index :restaurants, [:district_id, :cuisine_id]
  end
end
