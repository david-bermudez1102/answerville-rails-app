class QuestionsController < ApplicationController
    before_action :login_required
    
    def index
        @questions = Question.all
    end
end
