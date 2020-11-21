class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def total_cost
    customer_carts = current_customer.cart_items
    customer_carts.each do |customer_cart|
      (customer_cart.item.price_without_tax*1.1)*customer_cart.quantity
    end
  end

end
