class CulinaryRecipe < ApplicationRecord
  belongs_to :user
  has_many :culinary_recipe_foods
  has_many :foods, through: :culinary_recipe_foods

  validates :name, presence: true

  def total_price
    total = 0
    culinary_recipe_foods.each do |r_food|
      total += (r_food.quantity * r_food.food.price)
    end
    total
  end
end
