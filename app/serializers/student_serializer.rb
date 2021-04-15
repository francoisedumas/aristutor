class StudentSerializer
  include JSONAPI::Serializer
  extend Rails.application.routes.url_helpers
  attributes :id, :email, :first_name, :last_name, :phone_number, :mother_language, :photo

  attribute :photo do |student|
    puts "hello"
    student.photo.service_url if student.photo.attached?
  end

  has_many :courses
  has_many :teachers, through: :courses
end
