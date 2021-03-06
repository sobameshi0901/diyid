class RecipesController < ApplicationController
  before_action :set_recipes, only: [:show, :edit]
  before_action :set_materials_and_steps, only: [:show, :edit]
  def index
    # ランキング機能はまだなので、仮に数字を入れる
    @rankings = Recipe.includes(:user).order('updated_at DESC').limit(10)
    @new_pickup = Recipe.last
    @new_rankings = Recipe.includes(:user).order('updated_at DESC').limit(6)
    @recipes = Recipe.includes(:user).page(params[:page]).per(12)
  end

  def show
    @recipe  = Recipe.find(params[:id])
    @favorite = Favorite.find_by(user_id: current_user.id, recipe_id: params[:id]) if signed_in?
    @like = Like.find_by(user_id: current_user.id, recipe_id: params[:id]) if signed_in?
    @message = Message.new

  end

  def new
    @recipe = Recipe.new
    6.times {
      @recipe.steps.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      # タグの一覧を取得し、新しいタグは新規で登録
      tag_list = Tag.set_tags(params[:tag])
      # 取得したタグ一覧をTag_mapテーブルに保存
      @recipe.register_tags(tag_list)
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
      tag_list = Tag.set_tags(params[:tag])
      @recipe.update_tags(tag_list)
      redirect_to @recipe
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :comment, :build_time, :cost, :size, :point, :image, :category_id, steps_attributes: [:content, :image, :id], materials_attributes: [:name, :category, :id]).merge(user_id: current_user.id)
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
