class WelcomeController < ApplicationController
    
    before_action :session_already_set

    def home
    end
end
