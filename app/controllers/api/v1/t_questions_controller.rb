class Api::V1::TQuestionsController < ApplicationController 
  def index 
    render json: TQuestionSerializer.new(TQuestion.all)
  end
end