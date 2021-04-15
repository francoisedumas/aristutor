class TeacherLangueSerializer 
  include JSONAPI::Serializer
  attributes :id, :language, :teacher_id

  belongs_to :teacher
end
