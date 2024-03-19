class DiscountsController < ApplicationController
  before_action :set_discount, only: %i[ show edit update destroy ]

  # GET /discounts
  def index
    @discounts = Discount.all
  end

  # GET /discounts/1
  def show
  end

  # GET /discounts/new
  def new
    @discount = Discount.new
  end

  # GET /discounts/1/edit
  def edit
  end

  # POST /discounts
  def create
    @discount = Discount.new(discount_params)

    if @discount.save
      redirect_to @discount, notice: "Discount was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /discounts/1
  def update
    if @discount.update(discount_params)
      redirect_to @discount, notice: "Discount was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /discounts/1
  def destroy
    @discount.destroy
    redirect_to discounts_url, notice: "Discount was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discount_params
      params.require(:discount).permit(:code, :description, :value, :discount_type, :start_date, :end_date, :min_spend, :max_uses, :usage_count, :active, :user_id)
    end
end
