class Recipe < ActiveRecord::Base

  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients
  validates :name, presence: true

  accepts_nested_attributes_for :ingredients
  # , reject_if: :name_empty?



  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
        self.recipe_ingredients.build(:ingredient => ingredient)
      end
  end


end
