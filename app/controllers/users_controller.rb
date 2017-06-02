class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.create user_params
  end

  private

  def user_params
    params.require(:user).permit([:first_name, :last_name, :DOB])
  end

end
