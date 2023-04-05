class Api::V1::UsersController < ApplicationController
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


  private 
  def user_params
    params.permit(:username, :password, :email, :name)
  end
end