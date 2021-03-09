class Course < ApplicationRecord

  has_many :summaries

  belongs_to :teacher
  belongs_to :student

  validates :class_language, :teacher_id, :student_id, :presence true
end
