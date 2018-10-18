module PostMessage
  private
  def new_message_params
    params.require(:message).permit(:context).merge(user_id: current_user.id, question_id: @question.id, is_recipe_user: check_status, is_first: '0')
  end

  def reply_message_params
    params.permit(:context, :question_id).merge(user_id: current_user.id, is_recipe_user: check_status, is_first: '1')
  end

  # messageの投稿者がrecipeの投稿者と同じか判定
  def check_status
    current_user.id == Recipe.find(params[:recipe_id]).user_id ? '0' : '1'
  end

  def redirect_recipe_when_fail(message)
    redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
    flash[:danger] = message
  end
end