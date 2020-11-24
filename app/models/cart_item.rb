class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :quantity, presence: true
  validates :customer_id, presence: true

  def sub_price
    self.item.price_tax_included * self.quantity
  end

end
