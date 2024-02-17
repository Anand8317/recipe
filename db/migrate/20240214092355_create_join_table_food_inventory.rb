class CreateJoinTableFoodInventory < ActiveRecord::Migration[7.1]
  def change
    create_join_table :foods, :inventories do |t|
       t.integer :quantity, default: 1
       t.index [:food_id, :inventory_id]
       t.index [:inventory_id, :food_id]
    end
  end
end
