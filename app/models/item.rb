class Item < ApplicationRecord

  has_many :orders, through: :ordered_items
  has_many :cart_items
  has_many :ordered_items
  belongs_to :genre
  has_many :order_details, dependent: :destroy

  validates :name, presence: true
  validates :discription, presence: true, length: {minimum: 6, maximum: 100}

  attachment :image

  def price_tax_included
    (self.price_without_tax * 1.1).floor
  end

end
