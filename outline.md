[Flatiron Kitchen Lab Link](https://learn.co/tracks/full-stack-web-development/rails/layouts-and-partials/flatiron-kitchen)

## migrations

* Recipe
  * t.string :name

* Ingredient
  * t.string :name

* recipe_ingredients
  * t.integer :recipie_id
  * t.integer :ingredient_id


## models

class Recipe
 * has_many :recipe_ingredients
 * has_many :ingredients, through: :recipe_ingredients

 * validates_presence_of :name
end

class Ingredient
 * has_many :recipe_ingredients
 * has_many :recipes, through: :recipe_ingredients
  
 * validates_presence_of :name
end

class RecipeIngredients
 * belongs_to :recipe
 * belongs_to :ingredient
end


## views

recipes
 * index (display all reciepes)
 * show (show individual reciepe)
 * new
 * edit

ingredients
 * index (shows all ingredients and how many next to each)
 * show (shows individual ingredient)
 * new
 * edit