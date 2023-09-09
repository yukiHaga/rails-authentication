class UsersController < ApplicationController
  before_action :require_login, only: %i(show)

  # application_controllerでログインしているかどうかをチェックしている
  def show
    @name = current_user.name
  end
end