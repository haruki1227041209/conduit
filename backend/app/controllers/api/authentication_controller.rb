class Api::AuthenticationController < ApplicationController
  skip_before_action :authenticate_user, only: [:login]

  def login
    @user = User.find_by(email: params[:user][:email])

    if @user&.authenticate(params[:user][:password])
      token = generate_jwt_token(@user)
      render json: { user: { email: @user.email, username: @user.username, token: token } }, status: :ok
    else
      render json: { errors: { body: "Invalid email or password" } }, status: :unauthorized
    end
  end

  private

  def generate_jwt_token(user)
    payload = payload = { user_id: user.id, exp: 2.weeks.from_now.to_i }
    secret_key = Rails.application.secrets.secret_key_base
    JWT.encode(payload, secret_key)
  end
end