class AnswersController < ApplicationController
    before_action :login_required
    before_action :set_answer, only: [:show, :edit, :update, :destroy]

    def create
        answer = current_user.answers.build(answer_params)
        if answer.save
            flash[:success] = "Your answer was saved successfully."
            redirect_to user_question_path(username,answer.question)
        end
    end

    def edit
        unless @answer
            flash[:error] = "You cannot edit this content."
            redirect_to user_answers_path(current_user)
        end
    end

    private
        def answer_params
            params.require(:answer).permit(:content, :question_id)
        end

        def set_answer
            @answer = current_user.answers.find_by(id:params[:id])
        end

end
