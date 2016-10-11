class RecipesController < ApplicationController
  def new
  @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    if params[:recipe][:ingredient_ids].length >1
      params[:recipe][:ingredient_ids].each do |id|
        if id != ""
          @ingredient = Ingredient.find_by_id(id)
          @recipe.ingredients << @ingredient
        end
      end
    end

    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])

  end

  def update

    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
  if params[:recipe][:ingredient_ids][0] == ""
    @recipe.ingredients.clear
  elsif params[:recipe][:ingredient_ids].length >1
      params[:recipe][:ingredient_ids].each do |id|
        if id != ""
          @ingredient = Ingredient.find_by_id(id)
          @recipe.ingredients << @ingredient
        end
      end
    end

    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredients:[])
  end
end
