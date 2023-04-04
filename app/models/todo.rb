class Todo < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :item, :status 
end
