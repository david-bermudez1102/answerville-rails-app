class LikeAnswersController < ApplicationController

    def create
        answer = Answer.find_by(id:params[:answer_id])
        answer.likes.create(user:current_user) unless answer.liked?(current_user)
        redirect_to user_question_path(username,answer.question)
    end

    def destroy
        answer = Answer.find_by(id:params[:answer_id])
        like = answer.liked?(current_user)
        like.delete if like
        redirect_to user_question_path(username,answer.question)
    end
end
