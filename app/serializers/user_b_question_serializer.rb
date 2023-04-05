class UserBQuestionSerializer
  include JSONAPI::Serializer
  attributes :answer, :status 
end