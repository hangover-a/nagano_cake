class RenameMakingSatusColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :making_satus, :making_status
  end
end
