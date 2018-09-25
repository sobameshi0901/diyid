class RecipesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @recipe = Recipe.new
    6.times {
      @recipe.steps.build
    }
    6.times {
      @recipe.materials.build
    }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    binding.pry
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :comment, :build_time, :cost, :size, :point, :image, :category_id, steps_attributes: [:content, :image], materials_attributes: [:name, :category])
  end
end
