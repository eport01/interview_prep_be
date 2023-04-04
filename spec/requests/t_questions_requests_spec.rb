require 'rails_helper'

RSpec.describe 't_questions requests' do 
  it '/t_questions' do 
    question1 = TQuestion.create!(question: "What is the HTTP request/ response cycle?", q_type: 3)
    question2 = TQuestion.create!(question: "What is an API?", q_type: 3)
    question3 = TQuestion.create!(question: "What is your favorite Ruby on Rails gem?", q_type: 1)
  
    get "/api/v1/t_questions"
    expect(response).to be_successful 
    
    t_questions = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(t_questions.count).to eq(3)

    expect(t_questions[0]).to have_key(:id)
    expect(t_questions[0][:id]).to be_a String

    expect(t_questions[0]).to have_key(:type)
    expect(t_questions[0][:type]).to eq("t_question")

    expect(t_questions[0][:attributes]).to have_key(:question)
    expect(t_questions[0][:attributes][:question]).to be_a String 

    expect(t_questions[0][:attributes]).to have_key(:q_type)
    expect(t_questions[0][:attributes][:q_type]).to be_an Integer 
  end
end