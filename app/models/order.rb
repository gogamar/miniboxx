class Order < ApplicationRecord
  belongs_to :user
  belongs_to :billing_address
  belongs_to :shipping_address
  belongs_to :discount
  has_many :order_items
end
