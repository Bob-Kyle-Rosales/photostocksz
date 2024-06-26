class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user, only: [:create]

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = JsonWebToken.encode({ email: @user.email })
      render json: { auth_token: token }
    else
      render json: { error: "Incorrect Email Or password" }, status: :unauthorized
    end
  end
end
