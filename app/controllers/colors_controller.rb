class ColorsController < ApplicationController
  before_action :set_color, only: %i[ show edit update destroy ]

  # GET /colors
  def index
    @colors = Color.all
  end

  # GET /colors/1
  def show
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors
  def create
    @color = Color.new(color_params)

    if @color.save
      redirect_to @color, notice: "Color was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /colors/1
  def update
    if @color.update(color_params)
      redirect_to @color, notice: "Color was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /colors/1
  def destroy
    @color.destroy
    redirect_to colors_url, notice: "Color was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def color_params
      params.require(:color).permit(:name, :color_code, :variant_id)
    end
end
