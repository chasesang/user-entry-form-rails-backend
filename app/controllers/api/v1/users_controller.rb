class Api::V1::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

    def index
      users = User.all
      render json: users
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: { id: user.id, user: user, status: :success }
      else
        render json: { status: :failure, errors: user.errors.full_messages }
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :DOB)
    end
  end
