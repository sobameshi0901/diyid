class UsersController < ApplicationController
  def show
    @favo_recipes = current_user.favorites.map{|favo| favo.recipe} if current_user.favorites
    @post_recipes = current_user.recipes.includes(:user) if current_user.recipes
  end
end
