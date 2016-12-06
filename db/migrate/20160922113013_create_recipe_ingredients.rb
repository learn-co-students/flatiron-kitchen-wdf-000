class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :recipe_id
      t.belongs_to :ingredient_id

      t.timestamps null: false
    end
  end
end
