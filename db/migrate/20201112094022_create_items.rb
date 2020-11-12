class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :genre_id, null: false
      t.integer :name, null: false
      t.text :discription, null: false
      t.string :price_without_tax, null: false
      t.string :image_id, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
