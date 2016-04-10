class UsersController < ApplicationController


  def create
    handle = params[:handle]
    email = params[:email]
    password = params[:password]
    user = User.new(handle: handle, email: email, password_digest: password)
    user.set_last_sync!
    if user.save!
      render json: {token: user.token}, status: 200
    else
      render json: { errors: user.errors }, status: 402
    end
  end

  def get
    user = User.find_by(email: params[:email])
    render json: user, status: 200
  end

  private
  def user_params
    params.require(:user).permit(:handle, :email, :password)
  end

end
