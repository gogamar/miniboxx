class SessionCartsController < ApplicationController
  before_action :initialize_cart

  def add_to_cart
    puts "these are the params in add to cart: #{params}"
    product = Variant.find_by(id: params[:product])

    variant = product.variant

    if variant && product
      @cart.add_variant(variant, product)
      flash[:success] = "Variant added to cart successfully!"
    else
      flash[:error] = "Failed to add variant to cart. Variant or variant size not found."
    end

    redirect_to show_cart_path
  end

  def show_cart
    @cart_contents = session[:cart] || {}
  end

  private

  def initialize_cart
    @cart = current_cart
  end
end
