class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :username, :user_t_questions, :todos, :user_b_questions  

  
end 