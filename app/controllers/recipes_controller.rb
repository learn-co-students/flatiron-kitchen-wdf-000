class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show,:edit,:update]
  def new
    @recipe = Recipe.new
  end
  
  def show
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'create'
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name,ingredient_ids:[], ingredients_attributes:[:name])
  end

end
