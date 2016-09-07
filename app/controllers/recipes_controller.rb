require 'pry'
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    #creates a dummy recipe, with 1 dummy ingredient
    @recipe = Recipe.new
    ingredient = Ingredient.new
    @recipe.ingredients << ingredient
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipes_path
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes: [:name])
  end
end
