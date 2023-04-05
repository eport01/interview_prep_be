class Api::V1::BQuestionsController < ApplicationController
  def index 
    render json: BQuestionSerializer.new(BQuestion.all)
  end
end