class IngredientsController < ApplicationController
	# before_action :find_ingredient, only: [:show, :edit, :update]

	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		if @ingredient.save
			redirect_to ingredient_path @ingredient
		else
			render 'new'
		end
	end

	def edit
		@ingredient = Ingredient.find(params[:id])
	end

	def update
		@ingredient = Ingredient.find(params[:id])
		if @ingredient.update(ingredient_params)
			redirect_to @ingredient
		else
			render 'edit'
		end
	end

	def show
		@ingredient = Ingredient.find(params[:id])
	end

	# def index
	# end

	private
	# def find_ingredient
	# 	@ingredient = Ingredient.find(params[:id])
	# end

	def ingredient_params
		params.require(:ingredient).permit(:name)
	end

end
