migrations

Recipe
  t.string :name

Ingredient
  t.string :name

recipe_ingredients
  t.integer :recipie_id
  t.integer :ingredient_id


models

class Recipe
  has_many :ingredients
  validates_presence_of :name
end

class Ingredients
  belongs_to :recipe
  validates_presence_of :name
end

class RecipeIngredients
  belongs_to :recipe
  belongs_to :ingredient
end