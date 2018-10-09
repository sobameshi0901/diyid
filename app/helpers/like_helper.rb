module LikeHelper
  def like_count
    @recipe.likes.size
  end
end
