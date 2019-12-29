class AnswersController < ApplicationController
    def create
        question = Question.find_by(id:params[:question_id])
        answer = question.answers.build(answer_params)
        current_user.answers << answer
        if answer.save
            flash[:success] = "Your answer was saved successfully."
            redirect_to user_question_path(username,question)
        end
    end

    private
        def answer_params
            params.require(:answer).permit(:content)
        end

end
