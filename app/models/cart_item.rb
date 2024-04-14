class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  has_one :variant, through: :product
  has_one :size, through: :product

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
