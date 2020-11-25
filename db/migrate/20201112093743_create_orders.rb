class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.integer :delivery_fee, null: false
      t.integer :total_cost, null: false
      t.integer :payment_method, null: false, default: 0
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :addressee, null: false
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end


  end
end
