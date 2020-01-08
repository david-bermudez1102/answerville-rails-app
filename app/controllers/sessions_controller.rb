class SessionsController < ApplicationController
    before_action :session_already_set, only:[:new,:create]

    def new
        @user = User.new
    end

    def create
        if auth
<<<<<<< HEAD
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id
            session[:user_id] ? redirect_to(questions_path) : render(:new)
=======
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
>>>>>>> 335ac87c9e147d5c5761303fb985b1043b2cbb55
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
<<<<<<< HEAD
    end 
=======
    end
>>>>>>> 335ac87c9e147d5c5761303fb985b1043b2cbb55

    def destroy
        if is_logged_in?
            session.clear
            redirect_to root_url
        end
    end

    private
<<<<<<< HEAD
        def auth
            request.env['omniauth.auth']
        end
=======
    def auth
        request.env['omniauth.auth']
    end
>>>>>>> 335ac87c9e147d5c5761303fb985b1043b2cbb55
end
