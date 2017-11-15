class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.ingredients.last.try(:name)
      @recipe.ingredients.build
    end
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'spice')
    @recipe.ingredients.build(name: 'nice')
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name,
    ingredients_attributes: [
      :name,
      :quantity
      ]
    )
  end

end
