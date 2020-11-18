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

end
