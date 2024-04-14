class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
    @variants_with_images = Variant.joins(:image_urls).distinct
    @styles = Style.all
    @styles = Style.filter_by_category(params[:category_id], @styles)
    @styles = Style.filter_by_gender(params[:gender], @styles)
    variant_ids = Variant.where(style_id: @styles.ids).pluck(:id)
    @products = Product.where(variant_id: variant_ids)
  end

  def show
    @cart_item = CartItem.new
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed.", status: :see_other
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:current_stock, :epos_product_id, :barcode, :variant_id, :size_id)
    end
end
