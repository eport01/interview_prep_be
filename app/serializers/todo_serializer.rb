class TodoSerializer
  include JSONAPI::Serializer
  attributes :item, :status, :user_id  
end