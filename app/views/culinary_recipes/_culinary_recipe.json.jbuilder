json.extract! culinary_recipe, :id, :name, :preparation_time, :cooking_time, :description, :public, :user_id,
              :created_at, :updated_at
json.url culinary_recipe_url(culinary_recipe, format: :json)
