require 'rails_helper'

RSpec.describe 'users requests' do 
  it 'can create a new user' do 
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

  it 'create new user endpoint renders new user data and status 201' do 
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
end