class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.integer :user_id
      t.decimal :cash

      t.timestamps null: false
    end
  end
end
