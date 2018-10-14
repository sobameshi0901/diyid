class MessagesController < ApplicationController
  def create
    # このアクションに送られてくるのは新しいquestionなので、questionをnew&saveする。
    @question = Question.new(recipe_id: params[:recipe_id])
    @question.save
    # formで送られたparams+replyアクションと共通のカラムをセットするmessage_paramsに、最初の質問に対するis_firstに0を引数として渡してセット。
    message = Message.new(message_params('0'))
    message.save
    redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
  end


  private
  def message_params(is_first)
    params.require(:message).permit(:context).merge(user_id: current_user.id, question_id: @question.id, is_recipe_user: check_status, is_first: is_first)
  end

  # messageの投稿者がrecipeの投稿者と同じか判定
  def check_status
    if current_user.id == Recipe.find(params[:recipe_id]).user_id
      return '0'
    else
      return '1'
    end
  end
end
