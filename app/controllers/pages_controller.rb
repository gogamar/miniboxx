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
end
