class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :ingredient
end
