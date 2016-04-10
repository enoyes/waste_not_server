class SessionsController < ApplicationController

  def create
    password = params[:password]
    email = params[:email]
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      user.generate_auth_token!
      user.save
      render json: {token: user.token}, status: 200
    else
      render json: {errors: "Token not created"}, status: 422
    end
  end

end
