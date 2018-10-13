class MessagesController < ApplicationController
  def create
    if params[:message][:status] == 'new'
      @question = Question.new(recipe_id: params[:recipe_id])
      @question.save
      message = Message.new(message_params)
      message.save
      redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
    end
  end

  private
  def message_params
    params.require(:message).permit(:context).merge(user_id: current_user.id, question_id: @question.id)
  end
end
