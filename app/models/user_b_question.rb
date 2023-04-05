class UserBQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :b_question
  
  validates_presence_of :answer 

  def bquestion 
    self.b_question 
  end
end
