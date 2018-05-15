class DosesController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # @dose = Dose.new(description: param[:description], ingredients: param[:ingredient])
    @dose.cocktail = @cocktail
     if @dose.save
      redirect_to cocktail_path(@cocktail)
     else
      @ingredients = Ingredient.all - @cocktail.ingredients
      render 'cocktails/show'
    end
  end

private

def dose_params
  params.require(:dose).permit(:description, :ingredient_id)
end

end

