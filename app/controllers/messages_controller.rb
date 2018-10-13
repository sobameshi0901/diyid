class MessagesController < ApplicationController
  def create
    if params[:message][:status] == 'new'
      @question = Question.new(recipe_id: params[:recipe_id])
      @question.save
      @status = check_status
      message = Message.new(message_params)
      message.save
      redirect_to controller: :recipes, action: :show, id: params[:recipe_id]
    end
  end

  private
  def message_params
    params.require(:message).permit(:context).merge(user_id: current_user.id, question_id: @question.id, status: @status)
  end

  def check_status
    if current_user.id == Recipe.find(params[:recipe_id]).user_id
      return '0'
    else
      return '1'
    end
  end
end
