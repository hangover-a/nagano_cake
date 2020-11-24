class OrderCake < ApplicationRecord

  belongs_to :customer
  attachment :image

  validates :cake_type, presence: true
  validates :delivery_date, presence: true
  validates :cake_detail, presence: true
  validates :image, presence: true
  validates :cake_size, presence: true
  validates :post_status, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true

  def full_name
    self.last_name + self.first_name
  end
end
