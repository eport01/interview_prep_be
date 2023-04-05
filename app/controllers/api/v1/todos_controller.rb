class Api::V1::TodosController < ApplicationController
  before_action :find_user 
  def create 
    render json: TodoSerializer.new(Todo.create!(todo_params))
  end

  private

  def todo_params
    params.permit(:item, :status, :user_id)
  end

  def find_user 
    @user = User.find(params[:user_id])
  end
end