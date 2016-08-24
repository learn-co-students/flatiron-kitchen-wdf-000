class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients  

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank
  validate :valid_name


  def valid_name
    if name == '' or name == nil
      errors.add(:name, "must have a truthy name")
    end
  end
end
