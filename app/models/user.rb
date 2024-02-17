class User < ApplicationRecord
  validates :name, presence: true
  has_many :inventories, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :culinary_recipes, dependent: :destroy
end
