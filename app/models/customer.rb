class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :orders
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_cakes
  has_many :stocks, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :last_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: {minimum: 8, maximum: 15}, format: {with: /\A[0-9-]{,15}\z/}

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
