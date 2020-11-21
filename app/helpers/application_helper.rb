module ApplicationHelper
  
  def total_price(total)
    price = 0
    total.each do |total|
      price += total.sub_price
    end
    return price
  end
  
  def pricing_money(price, money)
    total_price(price) + money.delivery_fee
  end
  
end