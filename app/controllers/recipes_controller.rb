class RecipesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to controller: 'materials', action: 'new', recipe_id: @recipe.id
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :comment, :build_time, :cost, :size, :point,:image, :category_id, materials_attributes:[:name, :category],steps_attributes: [:content, :image])
  end
end
