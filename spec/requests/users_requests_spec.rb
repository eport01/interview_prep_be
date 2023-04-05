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
end