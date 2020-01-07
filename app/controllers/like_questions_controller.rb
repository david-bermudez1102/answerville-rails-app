class LikeQuestionsController < ApplicationController
    before_action :login_required
    
    def create
        question = Question.find_by(id:params[:question_id])
        question.likes.create(user:current_user) unless question.liked?(current_user)
        redirect_to user_question_path(username,question)
    end

    def destroy
        question = Question.find_by(id:params[:question_id])
        like = question.liked?(current_user)
        like.delete if like
        redirect_to user_question_path(username,question)
    end

end
