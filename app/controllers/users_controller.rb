class UsersController < ApplicationController
    before_action :session_already_set, only:[:new,:create]
    before_action :login_required, only:[:show,:edit,:update,:likes]

    def new
       @user = User.new
    end

    def create
       @user = User.new(user_params)
       if @user.save
        session[:user_id] = @user.id
        redirect_to questions_url
       else
        render :new
       end
    end

    def show
        @user = User.find_by(username:params[:id])
        @questions = @user.questions.order(id: :desc)
    end

    def edit
        @user = User.find_by(username:params[:id])
        redirect_to [:edit,current_user] unless current_user == @user
    end

    def update
        @user = User.find_by(username:params[:id])
        if current_user == @user && @user.update(user_params)
            if @user.previous_changes[:password_digest]
                session.clear
                flash[:success] = "Your password was updated with success. You have to log back in."
                redirect_to login_path
            else
                flash[:success] = "Information saved."
                redirect_to [:edit,current_user]
            end

        else
            render :edit
        end
    end

    def likes
        @user = User.find_by(username:params[:user_id])
        @dates_liked = @user.liked.group_by(&:date)
        render 'likes/index'
    end

    private
        def user_params
            params.require(:user).permit(:name,:username,:email,:password,:password_confirmation)
        end
end
