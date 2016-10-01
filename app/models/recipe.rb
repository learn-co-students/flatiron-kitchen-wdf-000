class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank
  
  def self.search(query)
    if query.present?
      where('NAME like ?', "%#{query}%")
    else
      self.all
    end
  end

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      self.recipe_ingredients.build(ingredient: ingredient)
    end
  end

  def count_dishes
    # BONUS IMPLEMENTATION (NOT VERY GOOD):
    # looks at ingredients of particular recipe
    # collects all ingredient amounts and returns smallest
    self.ingredients.collect {|i| i.amount}.min.to_s
  end

end
