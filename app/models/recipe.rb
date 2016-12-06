class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  def ingredients_ids=(array)
    array.each do |id|
      if !id.empty?
        ingr = Ingredient.find(id)
        self.ingredients << ingr
        ingr.save
      end
    end
  end



end
