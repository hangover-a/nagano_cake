class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false

      t.timestamps
      t.index [:customer_id, :item_id], unique: true
    end
  end
end
