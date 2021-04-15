class MistakeSerializer 
  include JSONAPI::Serializer
  attributes :id, :wrong_content, :correct_content, :status, :summary_id

  belongs_to :summary
end
