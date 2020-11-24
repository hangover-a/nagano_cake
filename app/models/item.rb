class Item < ApplicationRecord

  has_many :orders, through: :ordered_items
  has_many :cart_items
  has_many :ordered_items
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :stock_customers, through: :stocks, source: :customer

  validates :name, presence: true
  validates :discription, presence: true, length: {minimum: 6, maximum: 100}

  attachment :image

  def price_tax_included
    (self.price_without_tax * 1.1).floor
  end
  
  def stock(customer)
    stocks.create(customer_id: customer.id)
  end
  
  def unstock(customer)
    stocks.find_by(customer_id: customer.id).destroy
  end
  
  def stocked?(customer)
    stock_customers.include?(customer)
  end

end
