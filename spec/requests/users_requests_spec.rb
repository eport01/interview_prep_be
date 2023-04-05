require 'rails_helper'

RSpec.describe 'users requests' do 
  it 'can create a new user', :vcr do 
    user = {
      "name": "Louie",
      "email": "louie@zoe.com",
      "password": "1234",
      "username": "ilovecats"
    }

    post "/api/v1/users", headers: {'CONTENT_TYPE' => 'application/json'}, params: JSON.generate(user)

    new_user = User.last 

    expect(new_user.name).to eq("Louie")
    expect(new_user.email).to eq("louie@zoe.com")
    expect(new_user.username).to eq("ilovecats")
    expect(new_user.password_digest).to_not eq(nil)
  end

  it 'create new user endpoint renders new user data and status 201', :vcr do 
    user = {
      "name": "Louie",
      "email": "louie2@zoe.com",
      "password": "1234",
      "username": "ilovecats"
    }

    post "/api/v1/users", headers: {'CONTENT_TYPE' => 'application/json'}, params: JSON.generate(user)
    expect(response).to be_successful
    expect(response).to have_http_status 201
    user_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status 201
    expect(user_data[:data]).to have_key(:id)
    expect(user_data[:data][:type]).to eq("user")

    expect(user_data[:data][:attributes]).to have_key(:name)
    expect(user_data[:data][:attributes][:name]).to be_a String 
  end

  describe 'logging in a user' do 
    it 'can login with username and password', :vcr do 
      user = User.create(username: "chocolate", password: "123", name: "Zoe", email: "cats@test.com")

      credentials = {
        "username": "chocolate",
        "password": "123"
      }
      get "/api/v1/login", headers: {'CONTENT_TYPE' => 'application/json'}, params: credentials
    
      expect(response).to be_successful

      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe 'user index' do 
    before :each do 
      @user = User.create(username: "chocolate", password: "123", name: "Zoe", email: "cats@test.com")
      @tquestion1 = TQuestion.create!(question: "What is the HTTP request/ response cycle?", q_type: 3)
      @tquestion2 = TQuestion.create!(question: "What is an API?", q_type: 3)
      @tquestion3 = TQuestion.create!(question: "What is your favorite Ruby on Rails gem?", q_type: 1)
      @bquestion1 = BQuestion.create!(question: "Why do you want to work for this company?")
      @bquestion2 = BQuestion.create!(question: "What are you looking for in your next role?")
      @bquestion3 = BQuestion.create!(question: "What are you currently working on?")
      @todo1= @user.todos.create!(item: "apply for 3 jobs")
      @answer1 = UserTQuestion.create!(user_id: @user.id, t_question_id: @tquestion1.id, answer: "client and server communicate")
      @answer2 = UserTQuestion.create!(user_id: @user.id, t_question_id: @tquestion2.id, answer: "application programming interface")
      @answer3 = UserBQuestion.create!(user_id: @user.id, b_question_id: @bquestion1.id, answer: "I love to be challenged")

    end
    it 'endpoint with user relationships, all t and b questions, and todo items' do 
      input = {"username": @user.username}
      get "/api/v1/users", headers: {'CONTENT_TYPE' => 'application/json'}, params: input
      user_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status 200
      expect(user_data[:data]).to have_key(:id)
      expect(user_data[:data][:type]).to eq("user")
  
      expect(user_data[:data][:attributes]).to have_key(:name)
      expect(user_data[:data][:attributes][:name]).to be_a String 

      expect(user_data[:data][:attributes]).to have_key(:user_b_questions)
      expect(user_data[:data][:attributes][:user_b_questions]).to be_an Array 

      expect(user_data[:data][:attributes]).to have_key(:user_t_questions)
      expect(user_data[:data][:attributes][:user_t_questions]).to be_an Array 

      expect(user_data[:data][:attributes]).to have_key(:todos)
      expect(user_data[:data][:attributes][:todos]).to be_an Array 

      expect(user_data[:data][:attributes][:todos].count).to eq(1)

      expect(user_data[:data][:attributes][:user_t_questions].count).to eq(2)

      expect(user_data[:data][:attributes][:user_b_questions].count).to eq(1)


      expect(user_data[:data][:attributes][:user_t_questions][0][:answer]).to include(@answer1.answer)
      expect(user_data[:data][:attributes][:user_t_questions][1][:answer]).to include(@answer2.answer)
      expect(user_data[:data][:attributes][:user_b_questions][0][:answer]).to include(@answer3.answer)

    end
  end
end