class FoodsInventory < ApplicationRecord
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :food
  belongs_to :inventory
end
