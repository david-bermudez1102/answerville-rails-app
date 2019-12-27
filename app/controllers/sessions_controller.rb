class SessionsController < ApplicationController

    before_action :session_already_set, only:[:new,:create]

    def new
    end

    def create
        @user = User.find_by(email:params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to questions_path
        else
            flash[:error] = "Please enter valid login information."
            redirect_to login_url
        end
    end

    def destroy
        if is_logged_in?
            session.clear
            redirect_to root_url
        end
    end
end
