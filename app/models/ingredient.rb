class Ingredient < ActiveRecord::Base
  has_many :recipeIngredients
  has_many :recipe, through: :recipeIngredients
  validates :name, presence: true
end
