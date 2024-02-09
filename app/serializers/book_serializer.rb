class BookSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description
end
