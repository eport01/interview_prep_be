class Api::V1::UserTQuestionsController < ApplicationController
  def create 
    render json: UserTQuestionSerializer.new(UserTQuestion.create!(user_t_question_params)), status: 201
  end

  private 

  def user_t_question_params
    params.permit(:status, :answer, :user_id, :t_question_id)
  end
end