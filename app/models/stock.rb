class Stock < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :customer_id, presence: true
  validates :item_id, presence: true
  
  def self.get_stock_posts(customer)
    self.where(customer_id: customer.id).map(&:item)
  end
  
end
