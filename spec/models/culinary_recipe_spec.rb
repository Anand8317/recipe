require 'rails_helper'

RSpec.describe CulinaryRecipe, type: :model do
  it 'has a valid factory' do
    CulinaryRecipe = FactoryBot.build(:CulinaryRecipe)
    expect(CulinaryRecipe).to be_valid
  end

  it 'is not valid without a name' do
    CulinaryRecipe = FactoryBot.build(:CulinaryRecipe, name: nil)
    expect(CulinaryRecipe).to_not be_valid
  end

  it 'belongs to a user' do
    user_association = CulinaryRecipe.reflect_on_association(:user)
    expect(user_association.macro).to eq(:belongs_to)
  end

  it 'has many CulinaryRecipe_foods' do
    CulinaryRecipe = CulinaryRecipe.reflect_on_association(:CulinaryRecipe_foods)
    expect(CulinaryRecipe.macro).to eq(:has_many)
  end
end
