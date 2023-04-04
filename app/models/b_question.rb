class BQuestion < ApplicationRecord
  has_many :user_b_questions 
  has_many :users, through: :user_b_questions

  validates_presence_of :question 
end
