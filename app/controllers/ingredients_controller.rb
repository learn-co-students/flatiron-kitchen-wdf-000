class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.search(params[:query])
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
