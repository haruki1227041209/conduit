class Api::UsersController < ApplicationController
  def index
    render json: { status: "success" }
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: { user: user.as_json(only: [:username, :email, :password]) }, status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
