# spec/factories/culinary_recipe_foods.rb

FactoryBot.define do
  factory :culinary_recipe_food do
    association :culinary_recipe
    association :food
    # Any additional attributes you want to include in the factory
  end
end
