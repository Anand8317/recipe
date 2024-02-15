class CulinaryRecipeFood < ApplicationRecord
  belongs_to :culinary_recipe
  belongs_to :food
end
