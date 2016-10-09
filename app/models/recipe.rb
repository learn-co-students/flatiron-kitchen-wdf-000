class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  # accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }
  validates :name, :presence => true
  def ingredient_ids=(ingredient_ids)
    # binding.pry
    ingredients = nil
    if  ( ingredient_ids == [""] )
      ingredients = [] 
    else
      ingredients = Ingredient.where("id in (?)", ingredient_ids)
    end
    self.ingredients = ingredients
    self.save
  end
end
