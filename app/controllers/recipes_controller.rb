class RecipesController < ApplicationController
  before_action :set_recipes, only: [:show, :edit]
  before_action :set_materials_and_steps, only: [:show, :edit]
  def index
  end

  def show
    @recipe  = Recipe.find(params[:id])
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

  def set_recipes
    @recipe = Recipe.find(params[:id])
  end

  def set_materials_and_steps
    # レシピに紐づいているmaterialsのうち、categoryが0と1で分類し、それぞれを配列で保存。
    @materials_mate = @recipe.materials.select {|mate| mate.category == 0}
    @materials_tool = @recipe.materials.select { |mate| mate.category == 1}
    # こちらもコントローラで定義しておく。
    @steps = @recipe.steps
  end
end
