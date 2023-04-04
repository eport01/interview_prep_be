class TQuestionSerializer
  include JSONAPI::Serializer 
  attributes :question, :q_type 
end