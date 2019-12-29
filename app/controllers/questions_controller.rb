class QuestionsController < ApplicationController
    before_action :login_required
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def index
        @questions = Question.all
    end

    def show
        @question = Question.find_by(id:params[:id])
        @like = @question.likes.new
        @answer = Answer.new
    end

    def new
        @question = current_user.questions.build
    end

    def create
        @question = current_user.questions.build(question_params)
        if @question.save
            redirect_to user_question_path(username,@question)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @question.update(question_params)
            redirect_to user_question_path(username,@question)
        end
    end

    def destroy
        if @question.destroy
            flash[:success] = "The content was deleted successfully."
            redirect_to user_questions_path(username)
        else
            flash[:error] = "The content couldn't be deleted."
            redirect_to user_question_path(username,@question)
        end
    end

    private
        def question_params
            params.require(:question).permit(:content, :answered, category_ids:[], categories_attributes:[:name])
        end

        def set_question
            @question = current_user.questions.find_by(id:params[:id])
        end
end
