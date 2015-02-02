class CreateChineseCompanies < ActiveRecord::Migration
  def change
    create_table :chinese_companies do |t|
      # basic identification information
      t.integer :exchange_id
      t.string :symbol

      # name
      t.string :call_name
      t.string :chinese_name
      t.string :english_name

      # location
      t.text :address
      t.string :country
      t.string :province
      t.string :city
      t.string :region

      # A Share Market Information
      t.string :a_share_symbol
      t.string :a_share_call_name
      t.datetime :a_ipo_date
      t.decimal :a_share_total_issues
      t.decimal :a_share_current_issues

      # B Share Market Information
      t.string :b_share_symbol
      t.string :b_share_call_name
      t.datetime :b_ipo_date
      t.decimal :b_share_total_issues
      t.decimal :b_share_current_issues

      # industry
      t.string :industry

      # webiste
      t.string :website

      t.timestamps
    end
  end
end
