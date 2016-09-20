class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def edit
  end

  def new
    @ingredient = Ingredient.new
  end

  def update
  end

  def delete
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
