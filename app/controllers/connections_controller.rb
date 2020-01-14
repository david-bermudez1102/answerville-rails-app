class ConnectionsController < ApplicationController
  before_action :login_required

  def create
    user = User.find_by(username: params[:user_id])
    unless user.followers.include?(current_user) || user == current_user
      user.followers << current_user
    end
    redirect_to user
  end

  def destroy
    user = User.find_by(username: params[:user_id])
    following = current_user.following_connections.find_by(following: user)
    following&.destroy
    redirect_to user
  end

  def followers
    @user = User.find_by(username: params[:user_id])
    render 'followers/index'
  end

  def following
    @user = User.find_by(username: params[:user_id])
    render 'following/index'
  end
end
