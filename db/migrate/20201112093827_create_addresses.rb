class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.integer :costomer_id, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :addressee, null: false


      t.timestamps
    end
  end
end
