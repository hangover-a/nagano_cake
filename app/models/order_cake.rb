class OrderCake < ApplicationRecord

  belongs_to :customer
  attachment :image

  def full_name
    self.last_name + self.first_name
  end
end
