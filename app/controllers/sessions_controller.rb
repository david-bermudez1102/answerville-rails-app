class SessionsController < ApplicationController
    before_action :session_already_set, only:[:new,:create]

    def new
        @user = User.new
    end

    def create
        if auth
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name'] ? auth['info']['name'] : auth['info']['nickname']
                u.username = u.generate_username
                u.email = auth['info']['email']
                u.image = auth['info']['image']
                u.password = SecureRandom.hex
            end
                session[:user_id] = @user.id
                if session[:user_id]
                    redirect_to questions_path
                else
                    render :new
                end
        else           
            @user = User.find_by(email:params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to questions_path
            else
                flash[:error] = "Please enter valid login information."
                redirect_to login_url
            end
        end
    end

    def destroy
        if is_logged_in?
            session.clear
            redirect_to root_url
        end
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end
