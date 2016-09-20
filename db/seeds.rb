# Create Ingredients
Ingredient.destroy_all

20.times do
  Ingredient.create(name: Faker::Food.ingredient)
end
