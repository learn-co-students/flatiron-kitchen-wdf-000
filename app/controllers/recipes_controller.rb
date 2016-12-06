class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def edit 
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to new_recipe_path(@recipe)
    end
  end

  def show
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      redirect_to edit_recipe_path(@recipe)
    end
  end

  private

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [])
    end
end