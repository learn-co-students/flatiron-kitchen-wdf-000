class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def show
    @ingredient = set_ingred
  end

  def edit
    @ingredient = set_ingred
  end

  def update
    ingredient = set_ingred
    ingredient.update(ingre_params)
    if ingredient.save
      redirect_to ingredient_path(ingredient)
    else
      render 'new'
    end
  end

  def create
    ingredient = Ingredient.new(ingre_params)
    if ingredient.save
      redirect_to ingredient_path(ingredient)
    else
      render 'new'
    end
  end

  private
  def set_ingred
    @ingredient = Ingredient.find(params[:id])
  end

  def ingre_params
    params.require(:ingredient).permit(:name)
  end
end
