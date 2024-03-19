class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :billing_addresses
  has_many :shipping_addresses
  has_many :discounts
  has_many :carts
  has_many :orders
end
