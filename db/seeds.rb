# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ingredient.create([{name: 'salt'},{name: 'pepper'},{name: 'chocolate'},{name: 'milk'}])
Recipe.create([{name: 'SaltnPepa'},{name: 'chocolate milk'}])

#joins
RecipeIngredient.create(ingredient_id: 1, recipe_id: 1)
RecipeIngredient.create(ingredient_id: 2, recipe_id: 1)
RecipeIngredient.create(ingredient_id: 3, recipe_id: 2)
RecipeIngredient.create(ingredient_id: 4, recipe_id: 2)
