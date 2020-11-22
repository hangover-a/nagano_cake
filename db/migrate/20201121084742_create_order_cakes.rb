class CreateOrderCakes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_cakes do |t|
      t.integer :customer_id, null: false
      t.string :cake_type, null: false
      t.string :delivery_date, null: false
      t.text :cake_detail, null: false
      t.string :image_id, null: false
      t.string :cake_size, null: false
      t.boolean :post_status, default: true
      t.string :last_name, null: false
      t.string :first_name, null: false

      t.timestamps
    end
  end
end
