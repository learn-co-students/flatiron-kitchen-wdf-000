class Recipe < ActiveRecord::Base
  has_many :recipeIngredients
  has_many :ingredients, through: :recipeIngredients
  accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }
  validates :name, presence: true
  def ingredient_ids= (ids)
    self.ingredients.clear
    Ingredient.all.each do |x|
      self.ingredients << x if ids.include?(x.id.to_s)
    end
  end
end
