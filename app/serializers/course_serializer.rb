class CourseSerializer
  include JSONAPI::Serializer
  attributes :id, :class_language, :teacher_id, :student_id

  has_many :summaries

  belongs_to :teacher
  belongs_to :student
end
