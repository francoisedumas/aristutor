class WordSerializer
  include JSONAPI::Serializer
  attributes :id, :status, :summary_id, :word, :translation

  belongs_to :summary
end
