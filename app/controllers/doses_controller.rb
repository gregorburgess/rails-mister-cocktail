class DosesController < ApplicationController

  def show
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = @cocktail.ingredients
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # @dose = Dose.new(description: param[:description], ingredients: param[:ingredient])
    @dose.cocktail = @cocktail
     if @dose.save
      redirect_to cocktail_path(@cocktail)
     else
      @ingredients = Ingredient.all - @cocktail.ingredients
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

private

def dose_params
  params.require(:dose).permit(:description, :ingredient_id)
end

end

