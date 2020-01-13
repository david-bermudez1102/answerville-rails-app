class SearchController < ApplicationController

  def index
    if params[:query] && !params[:query].empty?
      @users = User.where("name LIKE ? or username LIKE ? or email LIKE ?", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%")
      @questions = Question.where("content LIKE ?","%#{params[:query]}%")
    else
      redirect_to root_path
    end
  end
end
