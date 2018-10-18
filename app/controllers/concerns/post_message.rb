module PostMessage
  private
  # messageの投稿者がrecipeの投稿者と同じか判定
  def check_status
    current_user.id == Recipe.find(params[:recipe_id]).user_id ? '0' : '1'
  end

  def redirect_recipe_when_fail(message)
    redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
    flash[:danger] = message
  end
end