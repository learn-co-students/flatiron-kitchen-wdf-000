class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]
  def index
    @ingredients = Ingredient.search(params[:query])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      redirect_to new_ingredient_path
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
