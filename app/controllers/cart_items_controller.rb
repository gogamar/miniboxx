class CartItemsController < ApplicationController
  before_action :set_cart, only: %i[ show create edit update destroy ]
  before_action :set_cart_item, only: %i[ show edit update destroy ]

  # GET /cart_items
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.cart = @cart
    @cart_item.quantity = 1

    if @cart_item.save
      @cart.update_total_price
      redirect_to @cart_item, notice: "Cart item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_items/1
  def update
    if @cart_item.update(cart_item_params)
      @cart.update_total_price
      redirect_to @cart_item, notice: "Cart item was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
    redirect_to cart_items_url, notice: "Cart item was successfully destroyed.", status: :see_other
  end

  private

  def set_cart
    @cart = current_user.cart.present? ? current_user.cart : Cart.create(user_id: current_user.id)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :cart_id, :product_id)
  end
end
