# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :session_already_set

  def home
    @user = User.new
  end
end
