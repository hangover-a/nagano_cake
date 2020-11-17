class ChangeDatatypePriceTaxIncludedofOrderedItems < ActiveRecord::Migration[5.2]
  def change
    change_column :ordered_items, :price_tax_included, :integer
  end
end
