require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :item }
    it { should validate_presence_of :status }

  end

  describe 'relationships' do 
    it { should belong_to(:user)}
  end

end 