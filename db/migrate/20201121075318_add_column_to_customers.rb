class AddColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    
    add_column  :customers,  :confirmation_token,  :string
    add_column  :customers,  :confirmed_at,        :datetime
    add_column  :customers,  :confirmation_sent_at,:datetime    
    add_column  :customers,  :unconfirmed_email,   :string
    
  end
end
