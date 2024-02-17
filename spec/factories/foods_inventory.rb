FactoryBot.define do
  factory :foods_inventory do
    quantity { 1 }
    association :inventory, factory: :inventory
    association :food, factory: :food
  end
end
