class CheckoutsController < ApplicationController

  def checkout
    cart = current_user.cart
    @order = Order.new(user: current_user, total_price: cart.total_price, total_items: cart.total_items)
  end

  def confirm
  end

  def complete
  end
end
