class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update]

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    Recipe.create(recipe_params)

    redirect_to recipes_path
  end

  def index
    @recipes = Recipe.all
  end

  def edit
    @ingredients = Ingredient.all
    @recipe_ingredients = @recipe.ingredients
  end

  def update
    @recipe.update(recipe_params)

    redirect_to recipes_path
  end



  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
