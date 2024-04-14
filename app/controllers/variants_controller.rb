class VariantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_variant, only: %i[ show edit update destroy ]

  def index
    @variants = Variant.joins(:image_urls).distinct
    @styles = Style.all
    @styles = Style.filter_by_category(params[:category_id], @styles)
    @styles = Style.filter_by_gender(params[:gender], @styles)
    @variants = Variant.where(style_id: @styles.ids)
  end

  def show
    @cart_item = CartItem.new
  end

  def new
    @variant = Variant.new
  end

  def edit
  end

  # POST /variants
  def create
    @variant = Variant.new(variant_params)

    if @variant.save
      redirect_to @variant, notice: "Variant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /variants/1
  def update
    if @variant.update(variant_params)
      redirect_to @variant, notice: "Variant was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /variants/1
  def destroy
    @variant.destroy
    redirect_to variants_url, notice: "Variant was successfully destroyed.", status: :see_other
  end

  private
    def set_variant
      @variant = Variant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variant_params
      params.require(:variant).permit(:external_id, :product_id, :color_id, :wsp_value, :rrp_value, :mark_up)
    end
end
