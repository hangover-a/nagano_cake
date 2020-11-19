class RenameAmountColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :amount, :quantity
  end
end
