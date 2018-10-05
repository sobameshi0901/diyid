class LikesController < ApplicationController
  def create
    @like = Like.create(recipe_id: params[:recipe_id], user_id: current_user.id)
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @like = Like.find(params[:id])
    @like.delete
    @like = nil
    @recipe = Recipe.find(params[:recipe_id])
  end
end
