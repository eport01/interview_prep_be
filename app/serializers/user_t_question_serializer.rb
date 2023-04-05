class UserTQuestionSerializer
  include JSONAPI::Serializer
  attributes :answer, :status, :tquestion  

end