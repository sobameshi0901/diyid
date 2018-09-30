class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(recipe_id: params[:recipe_id], user_id: current_user.id)
    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.delete
    redirect_to recipe_path(params[:recipe_id])
  end
end
