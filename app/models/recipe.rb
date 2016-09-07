class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients, reject_if: :empty_ingredient_name?


  def empty_ingredient_name?(ingred_attr)
    ingred_attr[:name].empty?
  end
  
end
