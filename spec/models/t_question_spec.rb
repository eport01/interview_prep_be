require 'rails_helper'

RSpec.describe TQuestion, type: :model do
  describe 'validations' do
    it { should validate_presence_of :question }

  end

  describe 'relationships' do 
    it { should have_many(:user_t_questions)}
    it { should have_many(:users).through(:user_t_questions)}
  end

end 