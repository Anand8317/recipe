require "test_helper"

class CulinaryRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @culinary_recipe = culinary_recipes(:one)
  end

  test "should get index" do
    get culinary_recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_culinary_recipe_url
    assert_response :success
  end

  test "should create culinary_recipe" do
    assert_difference("CulinaryRecipe.count") do
      post culinary_recipes_url, params: { culinary_recipe: { cooking_time: @culinary_recipe.cooking_time, description: @culinary_recipe.description, name: @culinary_recipe.name, preparation_time: @culinary_recipe.preparation_time, public: @culinary_recipe.public, user_id: @culinary_recipe.user_id } }
    end

    assert_redirected_to culinary_recipe_url(CulinaryRecipe.last)
  end

  test "should show culinary_recipe" do
    get culinary_recipe_url(@culinary_recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_culinary_recipe_url(@culinary_recipe)
    assert_response :success
  end

  test "should update culinary_recipe" do
    patch culinary_recipe_url(@culinary_recipe), params: { culinary_recipe: { cooking_time: @culinary_recipe.cooking_time, description: @culinary_recipe.description, name: @culinary_recipe.name, preparation_time: @culinary_recipe.preparation_time, public: @culinary_recipe.public, user_id: @culinary_recipe.user_id } }
    assert_redirected_to culinary_recipe_url(@culinary_recipe)
  end

  test "should destroy culinary_recipe" do
    assert_difference("CulinaryRecipe.count", -1) do
      delete culinary_recipe_url(@culinary_recipe)
    end

    assert_redirected_to culinary_recipes_url
  end
end
