require 'rails_helper'

RSpec.describe culinary_recipe_food, type: :model do
  it 'has a valid factory' do
    culinary_recipe_food = FactoryBot.build(:culinary_recipe_food)
    expect(culinary_recipe_food).to be_valid
  end

  it 'is not valid without a quantity' do
    culinary_recipe_food = FactoryBot.build(:culinary_recipe_food, quantity: nil)
    expect(culinary_recipe_food).to_not be_valid
  end

  it 'requires quantity to be a non-negative integer' do
    culinary_recipe_food = FactoryBot.build(:culinary_recipe_food, quantity: -1)
    expect(culinary_recipe_food).to_not be_valid

    culinary_recipe_food = FactoryBot.build(:culinary_recipe_food, quantity: 5) # Adjust the value as needed
    expect(culinary_recipe_food).to be_valid
  end

  it 'belongs to a recipe' do
    recipe_association = culinary_recipe_food.reflect_on_association(:recipe)
    expect(recipe_association.macro).to eq(:belongs_to)
  end

  it 'belongs to a food' do
    food_association = culinary_recipe_food.reflect_on_association(:food)
    expect(food_association.macro).to eq(:belongs_to)
  end
end
