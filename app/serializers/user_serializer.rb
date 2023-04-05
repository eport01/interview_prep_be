class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :username, :user_b_questions, :user_t_questions, :todos  



end