class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :variant_size
  has_one :variant, through: :variant_size
  has_one :size, through: :variant_size

  after_save :update_cart_total_price
  after_destroy :update_cart_total_price
  after_update :update_cart_total_price_if_quantity_changed

  private

  def update_cart_total_price
    cart.update_total_price
  end

  def update_cart_total_price_if_quantity_changed
    update_cart_total_price if saved_change_to_attribute?(:quantity)
  end
end
