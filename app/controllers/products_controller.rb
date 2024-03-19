class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:style_number, :style_name, :sales_description, :quality_description, :short_description, :gender, :fit, :size_name, :color_name, :variant_id, :composition, :wsp_value, :rrp_value, :quantity, :mark_up, :care_label, :wash_care, :fashion_forward)
    end
end
