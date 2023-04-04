require 'rails_helper'

RSpec.describe BQuestion, type: :model do
  describe 'validations' do
    it { should validate_presence_of :question }

  end

  describe 'relationships' do 
    it { should have_many(:user_b_questions)}
    it { should have_many(:users).through(:user_b_questions)}

  end

end 