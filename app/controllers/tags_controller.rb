class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes.includes(:user).page(params[:page]).per(12)
  end
end
