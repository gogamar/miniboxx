class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :discount, optional: true

  def update_total_price
    total = 0
    cart_items.each do |cart_item|
      product = cart_item.product
      variant = product.variant if product
      rrp_value = variant.rrp_value if variant
      total += rrp_value * cart_item.quantity if rrp_value
    end
    self.total_price = total
    save
  end
end
