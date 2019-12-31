class ConnectionsController < ApplicationController
    def create
        user = User.find_by(username:params[:user_id])
        user.followers << current_user unless user.followers.include?current_user
        redirect_to user
    end

    def destroy
        user = User.find_by(username:params[:user_id])
        following = current_user.following_connections.find_by(following:user)
        following.destroy if following
        redirect_to user
    end

    def followers
        @user = User.find_by(username:params[:user_id])
        render 'followers/index'
    end

    def following
        @user = User.find_by(username:params[:user_id])
        render 'following/index'
    end
end
