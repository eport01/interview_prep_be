require 'rails_helper'

RSpec.describe 'b_questions requests' do 
  it '/b_questions' do 
    question1 = BQuestion.create!(question: "Why do you want to work for this company?")
    question2 = BQuestion.create!(question: "What are you looking for in your next role?")
    question3 = BQuestion.create!(question: "What are you currently working on?")
  
    get "/api/v1/b_questions"
    expect(response).to be_successful 
    
    b_questions = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(b_questions.count).to eq(3)

    expect(b_questions[0]).to have_key(:id)
    expect(b_questions[0][:id]).to be_a String

    expect(b_questions[0]).to have_key(:type)
    expect(b_questions[0][:type]).to eq("b_question")

    expect(b_questions[0][:attributes]).to have_key(:question)
    expect(b_questions[0][:attributes][:question]).to be_a String 
  end
end