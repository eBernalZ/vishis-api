class SourceSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :url, :event_id
end
