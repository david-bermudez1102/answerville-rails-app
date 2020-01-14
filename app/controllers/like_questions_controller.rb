class LikeQuestionsController < ApplicationController
  before_action :login_required

  def create
    question = Question.find_by(id: params[:question_id])
    unless question.liked?(current_user)
      question.likes.create(user: current_user)
    end
    redirect_to user_question_path(username, question)
  end

  def destroy
    question = Question.find_by(id: params[:question_id])
    like = question.liked?(current_user)
    like.delete
    redirect_to user_question_path(username, question)
  end
end
