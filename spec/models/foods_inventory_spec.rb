require 'rails_helper'

RSpec.describe FoodsInventory, type: :model do
  it 'has a valid factory' do
    foods_inventory = FactoryBot.build(:foods_inventory)
    expect(foods_inventory).to be_valid
  end

  it 'requires quantity to be a non-negative integer' do
    foods_inventory = FactoryBot.build(:foods_inventory, quantity: -1)
    expect(foods_inventory).to_not be_valid

    foods_inventory = FactoryBot.build(:foods_inventory, quantity: 5)
    expect(foods_inventory).to be_valid
  end

  it 'requires quantity to be a non-negative integer' do
    foods_inventory = FactoryBot.build(:foods_inventory, quantity: -1)
    expect(foods_inventory).to_not be_valid

    foods_inventory = FactoryBot.build(:foods_inventory, quantity: 5)
    expect(foods_inventory).to be_valid
  end

  it 'belongs to an inventory' do
    inventory_association = FoodsInventory.reflect_on_association(:inventory)
    expect(inventory_association.macro).to eq(:belongs_to)
  end

  it 'belongs to a food' do
    food_association = FoodsInventory.reflect_on_association(:food)
    expect(food_association.macro).to eq(:belongs_to)
  end
end
