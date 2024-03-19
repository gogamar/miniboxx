class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def about
  end

  def contact
  end

  def cart
    @cart = current_user.cart
    @order = Order.new
  end

  def checkout
    cart = current_user.cart
    @order = Order.new(user: current_user, total_price: cart.total_price, total_items: cart.total_items)
  end
end
