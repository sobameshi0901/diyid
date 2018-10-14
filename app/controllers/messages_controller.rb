class MessagesController < ApplicationController
  def create
    # このアクションに送られてくるのは新しいquestionなので、questionをnew&saveする。
    @question = Question.new(recipe_id: params[:recipe_id])
    @question.save
    # formで送られたparams+replyアクションと共通のカラムをセットするmessage_paramsに、最初の質問に対するis_firstに0を引数として渡してセット。
    message = Message.new(new_message_params)
    message.save
    redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
  end

  def reply
    @question = Question.find(params[:question_id])
    message = Message.new(reply_message_params)
    message.save
    redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
  end

  def destroy
    message = Message.find(params[:id])
    # ユーザーがレシピ投稿者、もしくは質問投稿者の場合
    if current_user == Recipe.find(params[:recipe_id]).user || current_user == message.user
      # messageの親であるquestionを削除。子のmessagesも一緒にdestroyされる
      message.question.destroy
      redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
    end
  end

  private
  def new_message_params
    params.require(:message).permit(:context).merge(user_id: current_user.id, question_id: @question.id, is_recipe_user: check_status, is_first: '0')
  end

  def reply_message_params
    params.permit(:context, :question_id).merge(user_id: current_user.id, is_recipe_user: check_status, is_first: '1')
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
