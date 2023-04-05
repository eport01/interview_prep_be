class User < ApplicationRecord
  has_many :user_b_questions
  has_many :b_questions, through: :user_b_questions
  has_many :user_t_questions
  has_many :t_questions, through: :user_t_questions
  has_many :todos 

  validates_presence_of :name, :username, :password
  validates :email, uniqueness: true, presence: true 

  has_secure_password 
end
