class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_items, dependent: :destroy

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

  def sub_total(sub)
    price_tax_included(sub.item.price_without_tax) * sub.quantity
  end

  def total_cost(totals)
    cost = 0
    return cost
  end

end
