class UserTQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :t_question

  validates_presence_of :answer, :status 

  def tquestion 
    self.t_question 
  end
end
