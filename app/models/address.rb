class Address < ApplicationRecord

  belongs_to :customer

  def order_address
    self.postcode + self.address + self.addressee
  end

end
