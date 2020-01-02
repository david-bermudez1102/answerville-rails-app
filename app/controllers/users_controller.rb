class UsersController < ApplicationController
    before_action :session_already_set, only:[:new,:create]

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
