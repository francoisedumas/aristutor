class TeacherSerializer
  include JSONAPI::Serializer
  extend Rails.application.routes.url_helpers
  # set_type :teacher

  attributes :id, :email, :first_name, :last_name, :photo

  attribute :photo do |teacher|
    # puts teacher.photo.attached?
    teacher.photo.service_url if teacher.photo.attached?
  end

  # has_many :teacher_languages
  has_many :courses
  has_many :students, through: :courses
  has_many :summaries, through: :courses
end
