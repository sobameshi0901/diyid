class MessagesController < ApplicationController
  include PostMessage

  def create
    # このアクションに送られてくるのは新しいquestionなので、questionをnew&saveする。
    @question = Question.new(recipe_id: params[:recipe_id])
    if @question.save
      # formで送られたparams+replyアクションと共通のカラムをセットするmessage_paramsに、最初の質問に対するis_firstに0を引数として渡してセット。
      message = Message.new(new_message_params)
      if message.save
        redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
      else
        @question.delete
        redirect_recipe_when_fail('質問の投稿に失敗しました')
      end
    else
      redirect_recipe_when_fail('質問の投稿に失敗しました')
    end
  end

  def reply
    @question = Question.find(params[:question_id])
    message = Message.new(reply_message_params)
    if message.save
      redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
    else
      redirect_recipe_when_fail('質問への返信に失敗しました')
    end
  end

  def destroy
    message = Message.find(params[:id])
    # ユーザーがレシピ投稿者、もしくは質問投稿者の場合
    if current_user == Recipe.find(params[:recipe_id]).user || current_user == message.user
      # messageの親であるquestionを削除。子のmessagesも一緒にdestroyされる
      message.question.destroy
      redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
    else
      redirect_recipe_when_fail('投稿の削除に失敗しました')
    end
  end
end
