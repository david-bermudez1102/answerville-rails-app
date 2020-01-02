class ApplicationController < ActionController::Base
    
    protect_from_forgery

    helper_method :current_user, :is_logged_in?, :username, :owner?

    def login_required
        unless is_logged_in?
            flash[:error] = "Login Required."
            redirect_to login_url
        end
    end

    def session_already_set
        if is_logged_in?
            redirect_to questions_url
        end
    end

    def is_logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def owner?(content)
        content.user==current_user
    end

    def username
        current_user.username
    end
end
