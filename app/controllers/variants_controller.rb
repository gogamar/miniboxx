class VariantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_variant, only: %i[ show edit update destroy ]

  # GET /variants
  def index
    @variants = Variant.joins(:image_urls).distinct
  end

  # GET /variants/1
  def show
  end

  # GET /variants/new
  def new
    @variant = Variant.new
  end

  # GET /variants/1/edit
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
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variant_params
      params.require(:variant).permit(:external_id, :product_id, :color_id)
    end
end
