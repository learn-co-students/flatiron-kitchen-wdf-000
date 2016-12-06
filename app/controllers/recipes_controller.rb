class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end


  def create
    @recipe = Recipe.create(recipe_params)

    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end


  def edit
    # binding.pry
    @recipe = Recipe.find_by(params[:id])
  end

  def update
    @recipe = Recipe.find_by(params[:id])
    @recipe.update(recipe_params)

    redirect_to @recipe
  end


  private
    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [], :ingredient_attributes => [:name])
    end


end
