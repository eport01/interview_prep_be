require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }

  end

  describe 'relationships' do 
    it { should have_many(:user_b_questions) }
    it { should have_many(:b_questions).through(:user_b_questions) }
    it { should have_many(:user_t_questions) }
    it { should have_many(:t_questions).through(:user_t_questions) }

    it { should have_many(:todos) }

  end

end 