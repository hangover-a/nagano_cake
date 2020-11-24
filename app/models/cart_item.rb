class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def sub_price
    self.item.price_tax_included * self.quantity
  end

end
