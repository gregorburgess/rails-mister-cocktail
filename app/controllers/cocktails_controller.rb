class CocktailsController < ApplicationController
  # before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all - @cocktail.ingredients
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  # Using Simple Form

  def create

    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  # OR

  #   respond_to do |format|
  #     if @cocktail.save
  #       format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
  #       format.json { render :show, status: :created, location: @cocktail }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @cocktail.errors, status: :unprocessable_entity }
  #     end
  #   end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @cocktail.update(cocktail_params)
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully updated.' }
        format.json { render :show, status: :ok, location: @cocktail }
      else
        format.html { render :new }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    # no need for app/views/restaurants/destroy.html.erb - but here is the destroy code

    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path

    # OR

    # respond_to do |format|
    # format.html { redirect_to @cocktails, notice: 'Restaurant was successfully destroyed.' }
    # format.json { head :no_content }
    # end
  end

private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredients, :doses)
  end

end
