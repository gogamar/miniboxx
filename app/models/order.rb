class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shipping_address
  belongs_to :billing_address, optional: true
  belongs_to :discount, optional: true
  has_many :order_items, dependent: :destroy

  enum status: [:pending, :processing, :failed, :succeed]
end
