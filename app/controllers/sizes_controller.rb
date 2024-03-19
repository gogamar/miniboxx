class SizesController < ApplicationController
  before_action :set_size, only: %i[ show edit update destroy ]

  # GET /sizes
  def index
    @sizes = Size.all
  end

  # GET /sizes/1
  def show
  end

  # GET /sizes/new
  def new
    @size = Size.new
  end

  # GET /sizes/1/edit
  def edit
  end

  # POST /sizes
  def create
    @size = Size.new(size_params)

    if @size.save
      redirect_to @size, notice: "Size was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sizes/1
  def update
    if @size.update(size_params)
      redirect_to @size, notice: "Size was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sizes/1
  def destroy
    @size.destroy
    redirect_to sizes_url, notice: "Size was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      @size = Size.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def size_params
      params.require(:size).permit(:name, :quantity, :variant_id)
    end
end
