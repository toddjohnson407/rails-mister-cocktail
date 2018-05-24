class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  before_action :set_dose, only: [:destroy]

  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @dose = Dose.new
  end

  def edit
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    if @dose.update(dose_params)
      redirect_to dose_path(@dose)
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end
