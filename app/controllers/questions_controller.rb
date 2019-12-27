class QuestionsController < ApplicationController
    before_action :login_required

    def index
        @questions = Question.all
    end

    def new
        @question = current_user.questions.build
    end

    def create
        
    end

    def edit
        @question = current_user.questions.find(params[:id])
    end

    private
        def question_params
            params.require(:question).permit(:content, :category_ids[])
        end
end
