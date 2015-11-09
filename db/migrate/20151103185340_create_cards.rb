class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :cardnum
      t.string :cardsecuritynum
      t.string :cardexp
      t.string :cardcompany
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
