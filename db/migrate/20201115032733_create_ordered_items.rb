class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|

      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :quantity, null: false
      t.integer :item_status, null: false, default: 0
      t.integer :price_tax_included, null: false

      t.timestamps
    end
  end
end
