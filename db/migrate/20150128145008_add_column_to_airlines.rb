class AddColumnToAirlines < ActiveRecord::Migration
  def change
    add_column :airlines, :airplanes_count, :integer
  end
end
