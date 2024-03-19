class SubBrandsController < ApplicationController
  before_action :set_sub_brand, only: %i[ show edit update destroy ]

  # GET /sub_brands
  def index
    @sub_brands = SubBrand.all
  end

  # GET /sub_brands/1
  def show
  end

  # GET /sub_brands/new
  def new
    @sub_brand = SubBrand.new
  end

  # GET /sub_brands/1/edit
  def edit
  end

  # POST /sub_brands
  def create
    @sub_brand = SubBrand.new(sub_brand_params)

    if @sub_brand.save
      redirect_to @sub_brand, notice: "Sub brand was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sub_brands/1
  def update
    if @sub_brand.update(sub_brand_params)
      redirect_to @sub_brand, notice: "Sub brand was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sub_brands/1
  def destroy
    @sub_brand.destroy
    redirect_to sub_brands_url, notice: "Sub brand was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_brand
      @sub_brand = SubBrand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_brand_params
      params.fetch(:sub_brand, {})
    end
end
