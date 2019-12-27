class SessionsController < ApplicationController

    before_action :session_already_set

    def new
    end

    def create
        @user = User.find_by(username:params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to questions_path
        else
            flash[:error] = "Please enter valid login information."
            redirect_to login_url
        end
    end
end
