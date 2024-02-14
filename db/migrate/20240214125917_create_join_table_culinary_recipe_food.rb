class CreateJoinTableCulinaryRecipeFood < ActiveRecord::Migration[7.1]
  def change
    create_join_table :culinary_recipe, :foods do |t|
      t.index :culinary_recipe_id
      t.index :food_id
    end
  end
end
