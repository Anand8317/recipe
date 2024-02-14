class CulinaryRecipesController < ApplicationController
  before_action :set_culinary_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /culinary_recipes or /culinary_recipes.json
  def index
    @culinary_recipes = current_user.culinary_recipes
  end

  # GET /culinary_recipes/1 or /culinary_recipes/1.json
  def show
    @culinary_recipe_foods = @culinary_recipe.foods
  end

  # GET /culinary_recipes/new
  def new
    @culinary_recipe = CulinaryRecipe.new
  end

  # GET /culinary_recipes/1/edit
  def edit; end

  # POST /culinary_recipes or /culinary_recipes.json
  def create
    @culinary_recipe = CulinaryRecipe.new(culinary_recipe_params)

    respond_to do |format|
      if @culinary_recipe.save
        format.html { redirect_to culinary_recipes_url, notice: 'Culinary recipe was successfully created.' }
        format.json { render :show, status: :created, location: @culinary_recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @culinary_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /culinary_recipes/1 or /culinary_recipes/1.json
  def update
    respond_to do |format|
      if @culinary_recipe.update(culinary_recipe_params)
        format.html { redirect_to culinary_recipes_url, notice: 'Culinary recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @culinary_recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @culinary_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /culinary_recipes/1 or /culinary_recipes/1.json
  def destroy
    @culinary_recipe.destroy!

    respond_to do |format|
      format.html { redirect_to culinary_recipes_url, notice: 'Culinary recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_ingredient
    # Find the recipe by ID
    culinary_recipe = CulinaryRecipe.find(params[:id])

    # Create a new Food item or find an existing one
    food = Food.find_or_create_by(name: params[:name], measurement_unit: params[:measurement_unit],
                                  price: params[:price])

    # Add the food to the recipe with quantity
    # This assumes you have a `quantity` column in the join table
    culinary_recipe_food = culinary_recipe.culinary_recipe_foods.build(food:, quantity: params[:quantity])

    if culinary_recipe_food.save
      # Successfully added food to recipe
      redirect_to culinary_recipe_path(culinary_recipe), notice: 'Food added successfully.'
    else
      # Handle errors, e.g., render the form again with error messages
      render new_ingredient_form, alert: 'Error adding food to recipe.'
    end
  end

  def new_ingredient_form
    @culinary_recipe = CulinaryRecipe.find(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_culinary_recipe
    @culinary_recipe = CulinaryRecipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def culinary_recipe_params
    params.require(:culinary_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
