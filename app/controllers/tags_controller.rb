class TagsController < ApplicationController
  def show
    @recipes = Tag.find(params[:id]).recipes.includes(:user).page(params[:page]).per(12)
    @tag = Tag.find(params[:id])
  end
end
