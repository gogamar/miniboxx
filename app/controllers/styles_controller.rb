class StylesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_style, only: %i[ show edit update destroy ]

  def index
    @styles = Style.all
  end

  # GET /styles/1
  def show
  end

  # GET /styles/new
  def new
    @style = Style.new
  end

  # GET /styles/1/edit
  def edit
  end

  # POST /styles
  def create
    @style = Style.new(style_params)

    if @style.save
      redirect_to @style, notice: "Style was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /styles/1
  def update
    if @style.update(style_params)
      redirect_to @style, notice: "Style was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /styles/1
  def destroy
    @style.destroy
    redirect_to styles_url, notice: "Style was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_style
      @style = Style.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def style_params
      params.require(:style).permit(:style_number, :style_name, :sales_description_en, :quality_description_en, :short_description, :gender, :fit, :size_name, :color_name, :variant_id, :composition, :care_label, :wash_care_en, :fashion_forward, :sales_description_es, :quality_description_es, :wash_care_es)
    end
end
