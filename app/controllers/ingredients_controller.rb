class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.search(params[:query])
  end

  def new
  end

  def create
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end
end
