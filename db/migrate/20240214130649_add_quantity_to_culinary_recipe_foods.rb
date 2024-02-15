class AddQuantityToCulinaryRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    add_column :culinary_recipe_foods, :quantity, :integer
  end
end
