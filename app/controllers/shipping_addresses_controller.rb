class ShippingAddressesController < ApplicationController
  before_action :set_shipping_address, only: %i[ show edit update destroy ]

  # GET /shipping_addresses
  def index
    @shipping_addresses = ShippingAddress.all
  end

  # GET /shipping_addresses/1
  def show
  end

  # GET /shipping_addresses/new
  def new
    @shipping_address = ShippingAddress.new
  end

  # GET /shipping_addresses/1/edit
  def edit
  end

  # POST /shipping_addresses
  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.user = current_user

    if @shipping_address.save
      redirect_to @shipping_address, notice: "Shipping address was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shipping_addresses/1
  def update
    if @shipping_address.update(shipping_address_params)
      redirect_to @shipping_address, notice: "Shipping address was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /shipping_addresses/1
  def destroy
    @shipping_address.destroy
    redirect_to shipping_addresses_url, notice: "Shipping address was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_address
      @shipping_address = ShippingAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipping_address_params
      params.require(:shipping_address).permit(:name, :address_first, :address_second, :post_code, :city, :region, :country, :phone_number)
    end
end
