class Inventory < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true

  belongs_to :user, foreign_key: 'user_id'
  has_many :foods_inventories
  has_many :foods, through: :foods_inventories
end
