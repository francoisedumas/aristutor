class SummarySerializer
  include JSONAPI::Serializer
  attributes :id, :title, :course_id, :status, :overview

  has_many :words
  has_many :mistakes
  belongs_to :course
end
