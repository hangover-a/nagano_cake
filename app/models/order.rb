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

  enum order_status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済み: 4
  }

  def price_tax_included(price)
    (price * 1.1).floor
  end

  def total_cost
    price = 0
    self.order_details.each do |order_detail|
      price += order_detail.price * order_detail.quantity
    end
    return price
  end

  def pricing
    self.total_cost + self.delivery_fee
  end

end
