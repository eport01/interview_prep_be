class Api::V1::UsersController < ApplicationController
  
  def index 
    user = User.find_by(username: params[:username])
    render json: UserSerializer.new(user)
  end
  def create 
    user = User.new(user_params) 
    if user.valid?
      user.save 
      session[:user_id] = user.id 
      render json: UserSerializer.new(User.last), status: 201 
    else
      render json: {error: "Invalid user"}, status: 404
    end
  end

  def login 
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id 
      render json: {message: "Successfully logged in!"}
    else
      render json: {error: "Unable to login"}, status: 404

    end
  end

  private 
  def user_params
    params.permit(:username, :password, :email, :name)
  end
end