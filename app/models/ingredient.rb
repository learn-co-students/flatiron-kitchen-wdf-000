class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validate :valid_name

  def valid_name
    if name == '' or name == nil
      errors.add(:name, "must have a truthy name")
    end
  end
end
