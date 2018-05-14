class DosesController < ApplicationController

  def new
    @dose = Cocktail.find[:cocktail_id]
    # @dose = Cocktail.find[:cocktail_id]
    # @ingredients = Ingredients.all - cocktail.ingredients
    # @cocktail = @dose.cocktail
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # @dose = Dose.new(description: param[:description], ingredients: param[:ingredient])
    @dose.cocktail = @cocktail
     if @dose.save
      redirect_to cocktail_path(@cocktail)
     else
      render 'cocktails/show'
    end
  end

private

def dose_params
  params.require(:dose).permit(:description, :ingredient_id)
end

end
