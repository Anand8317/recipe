class CulinaryRecipe < ApplicationRecord
  belongs_to :user
  has_many :culinary_recipe_foods
  has_many :foods, through: :culinary_recipe_foods
end
