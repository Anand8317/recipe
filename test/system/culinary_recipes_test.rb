require 'application_system_test_case'

class CulinaryRecipesTest < ApplicationSystemTestCase
  setup do
    @culinary_recipe = culinary_recipes(:one)
  end

  test 'visiting the index' do
    visit culinary_recipes_url
    assert_selector 'h1', text: 'Culinary recipes'
  end

  test 'should create culinary recipe' do
    visit culinary_recipes_url
    click_on 'New culinary recipe'

    fill_in 'Cooking time', with: @culinary_recipe.cooking_time
    fill_in 'Description', with: @culinary_recipe.description
    fill_in 'Name', with: @culinary_recipe.name
    fill_in 'Preparation time', with: @culinary_recipe.preparation_time
    check 'Public' if @culinary_recipe.public
    fill_in 'User', with: @culinary_recipe.user_id
    click_on 'Create Culinary recipe'

    assert_text 'Culinary recipe was successfully created'
    click_on 'Back'
  end

  test 'should update Culinary recipe' do
    visit culinary_recipe_url(@culinary_recipe)
    click_on 'Edit this culinary recipe', match: :first

    fill_in 'Cooking time', with: @culinary_recipe.cooking_time
    fill_in 'Description', with: @culinary_recipe.description
    fill_in 'Name', with: @culinary_recipe.name
    fill_in 'Preparation time', with: @culinary_recipe.preparation_time
    check 'Public' if @culinary_recipe.public
    fill_in 'User', with: @culinary_recipe.user_id
    click_on 'Update Culinary recipe'

    assert_text 'Culinary recipe was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Culinary recipe' do
    visit culinary_recipe_url(@culinary_recipe)
    click_on 'Destroy this culinary recipe', match: :first

    assert_text 'Culinary recipe was successfully destroyed'
  end
end
