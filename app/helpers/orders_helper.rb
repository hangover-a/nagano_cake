module OrdersHelper

  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end

  def price_tax_included(price)
    (price * 1.1).floor
  end

  def sub_price(cart)
    (price_tax_included(cart) * cart.quantity)
  end

  def total_cost(total)
    price = 0
    total.each do |total|
      price += sub_price(total)
    end
    return price
  end

  def pricing(order)
    total_cost(current_customer.cart_items) + order.delivery_fee
  end

end
