require 'rails_helper'

RSpec.describe 'user questions endpoints' do 
  describe 'a logged in user can save and answer a b question' do 
    it 'creates and saves instance of user_b_question' do 
      b_question = BQuestion.create!(question: "Why do you want to work for this company?")
      user = User.create(username: "chocolate", password: "123", name: "Zoe", email: "cats@test.com")

      credentials = {
        "username": "chocolate",
        "password": "123"
      }
      get "/api/v1/login", headers: {'CONTENT_TYPE' => 'application/json'}, params: credentials

      input = {
        "answer": "great question",
        "b_question_id": b_question.id 
      }
      post "/api/v1/users/#{session[:user_id]}/user_b_questions", headers: {'CONTENT_TYPE' => 'application/json'}, params: JSON.generate(input)
    
      expect(response).to have_http_status 201

      saved_question = JSON.parse(response.body, symbolize_names: true)

      expect(saved_question[:data]).to have_key(:id)
      expect(saved_question[:data][:type]).to eq("user_b_question")

      expect(saved_question[:data][:attributes]).to have_key(:answer)
      expect(saved_question[:data][:attributes][:answer]).to be_a String 

      expect(saved_question[:data][:attributes]).to have_key(:status)
      expect(saved_question[:data][:attributes][:status]).to be_an Integer 

      expect(saved_question[:data][:attributes][:status]).to eq(1) 

      expect(user.user_b_questions.last).to eq(UserBQuestion.last)

    end
  end



  describe 'a logged in user can save and answer a t question' do 
    it 'creates and saves instance of user_t_question' do 
      t_question = TQuestion.create!(question: "What is an API", q_type: 3)
      user = User.create(username: "chocolate", password: "123", name: "Zoe", email: "cats@test.com")

      credentials = {
        "username": "chocolate",
        "password": "123"
      }
      #login user 
      get "/api/v1/login", headers: {'CONTENT_TYPE' => 'application/json'}, params: credentials

      input = {
        "answer": "application programming interface...",
        "t_question_id": t_question.id 
      }

      #answer and save question
      post "/api/v1/users/#{session[:user_id]}/user_t_questions", headers: {'CONTENT_TYPE' => 'application/json'}, params: JSON.generate(input)
    
      expect(response).to have_http_status 201

      saved_question = JSON.parse(response.body, symbolize_names: true)

      expect(saved_question[:data]).to have_key(:id)
      expect(saved_question[:data][:type]).to eq("user_t_question")

      expect(saved_question[:data][:attributes]).to have_key(:answer)
      expect(saved_question[:data][:attributes][:answer]).to be_a String 

      expect(saved_question[:data][:attributes]).to have_key(:status)
      expect(saved_question[:data][:attributes][:status]).to be_an Integer 

      expect(saved_question[:data][:attributes][:status]).to eq(1) 

      expect(user.user_t_questions.last).to eq(UserTQuestion.last)

    end
  end
end