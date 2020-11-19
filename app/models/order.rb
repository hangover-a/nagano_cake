class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  with_options presence: true do
    validates :payment_method
    validates :postcode
    validates :address
    validates :addressee
  end

  enum payment_method: {
    credit_card: 0,
    bank_transfer: 1
  }

  def price_tax_included(price)
    (price * 1.1).floor
  end

  def total_cost(total)
    price = 0
    total.each do |total|
      price += total.sub_price
    end
    return price
  end

  def pricing(cart_items)
    self.total_cost(cart_items) + self.delivery_fee
  end

end
