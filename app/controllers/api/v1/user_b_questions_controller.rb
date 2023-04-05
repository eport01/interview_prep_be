class Api::V1::UserBQuestionsController < ApplicationController
  def create 
    render json: UserBQuestionSerializer.new(UserBQuestion.create!(user_b_question_params)), status: 201
  end

  private 

  def user_b_question_params
    params.permit(:status, :answer, :user_id, :b_question_id)
  end
end