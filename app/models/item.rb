class Item < ApplicationRecord

  has_many :orders, through: :ordered_items
  has_many :cart_items
  has_many :ordered_items
  belongs_to :genre
  
  attachment :image

end
