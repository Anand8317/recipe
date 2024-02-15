class AddPrimaryKeyToCulinaryRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    add_column :culinary_recipe_foods, :id, :primary_key
  end
end
