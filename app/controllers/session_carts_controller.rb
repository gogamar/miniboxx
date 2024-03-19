class SessionCartsController < ApplicationController
  before_action :initialize_cart

  def add_to_cart
    puts "these are the params in add to cart: #{params}"
    variant_size = Variant.find_by(id: params[:variant_size])

    variant = variant_size.variant

    if variant && variant_size
      @cart.add_variant(variant, variant_size)
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
