require 'rails_helper'

RSpec.describe UserBQuestion, type: :model do
  describe 'validations' do
    it { should validate_presence_of :answer }

  end

  describe 'relationships' do 
    it {should belong_to(:user)}
    it {should belong_to(:b_question)}

  end

  
end 