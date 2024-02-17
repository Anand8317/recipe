require 'rails_helper'

RSpec.describe culinary_recipe, type: :model do
  it 'has a valid factory' do
    culinary_recipe = FactoryBot.build(:culinary_recipe)
    expect(culinary_recipe).to be_valid
  end

  it 'is not valid without a name' do
    culinary_recipe = FactoryBot.build(:culinary_recipe, name: nil)
    expect(culinary_recipe).to_not be_valid
  end

  it 'belongs to a user' do
    user_association = culinary_recipe.reflect_on_association(:user)
    expect(user_association.macro).to eq(:belongs_to)
  end

  it 'has many culinary_recipe_foods' do
    culinary_recipe = culinary_recipe.reflect_on_association(:culinary_recipe_foods)
    expect(culinary_recipe.macro).to eq(:has_many)
  end
end