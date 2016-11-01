class IngredientsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    Ingredient.create(ingredient_params)

    redirect_to ingredients_path
  end

  def index
    @ingredients = Ingredient.all
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)

    redirect_to ingredients_path
  end


  private

  def set_post
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
