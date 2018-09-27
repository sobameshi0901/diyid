class RecipesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @recipe = Recipe.new
    6.times {
      @recipe.steps.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @materials_mate = @recipe.materials.select {|mate| mate.category == 0}
    @materials_tool = @recipe.materials.select { |mate| mate.category == 1}
    @steps = @recipe.steps
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :comment, :build_time, :cost, :size, :point, :image, :category_id, steps_attributes: [:content, :image, :id], materials_attributes: [:name, :category, :id])
  end
end
