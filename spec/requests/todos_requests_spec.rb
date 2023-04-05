require 'rails_helper'

RSpec.describe 'todos requests' do 
  describe 'a logged in user can create a todo list item' do 
    it 'creates todo item' do 
      user = User.create(username: "chocolate", password: "123", name: "Zoe", email: "cats@test.com")

      credentials = {
        "username": "chocolate",
        "password": "123"
      }
      get "/api/v1/login", headers: {'CONTENT_TYPE' => 'application/json'}, params: credentials
    
      todo = {
        "item": "Apply for 3 jobs"
      }

      post "/api/v1/users/#{session[:user_id]}/todos", headers: {'CONTENT_TYPE' => 'application/json'}, params: JSON.generate(todo)
    
      expect(response).to be_successful 
    
      todo = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(todo).to have_key(:id)
      expect(todo[:id]).to be_a String 

      expect(todo).to have_key(:type)
      expect(todo[:type]).to eq("todo")

      expect(todo[:attributes]).to have_key(:item)
      expect(todo[:attributes][:item]).to be_a String

      expect(todo[:attributes]).to have_key(:status)
      expect(todo[:attributes][:status]).to be_an Integer 

      expect(todo[:attributes]).to have_key(:user_id)
      expect(todo[:attributes][:user_id]).to be_an Integer 
    end
  end
end