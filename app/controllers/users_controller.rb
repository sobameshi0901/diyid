class UsersController < ApplicationController
  def show
    @favo_recipes = Recipe.joins(:favorites).where("favorites.user_id = ?", current_user.id)
    @post_recipes = Recipe.joins(:user).where("users.id = ?", current_user.id)
  end
end
