class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :shipping_address
  belongs_to :billing_address
  belongs_to :discount_code
end
