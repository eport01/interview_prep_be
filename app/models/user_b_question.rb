class UserBQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :b_question
  
  validates_presence_of :answer 

end
