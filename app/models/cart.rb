class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user, optional: true
  belongs_to :discount, optional: true

  def update_total_price
    self.total_price = cart_items.sum { |cart_item| cart_item.variant.product.rrp_value * cart_item.quantity }
    save
  end
end
