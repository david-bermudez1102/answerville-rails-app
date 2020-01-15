# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :login_required

  def index
    if params[:query] && !params[:query].empty?
      @users = User.search(params[:query])
      @questions = Question.search(params[:query])
    else
      redirect_to root_path
    end
  end
end
