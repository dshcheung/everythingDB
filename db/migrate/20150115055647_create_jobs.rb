class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
			t.integer :employer_id
      t.string :jobsdb_id
      t.text :position_about
      t.string :position_name

      t.timestamps
    end
  end
end
