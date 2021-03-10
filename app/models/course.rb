class Course < ApplicationRecord

  has_many :summaries

  belongs_to :teacher
  belongs_to :student

  validates :class_language, :teacher_id, :student_id, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_first_and_last_name,
    associated_against: {student: [ :first_name, :last_name ]},
    using: {
      tsearch: { prefix: true } # start returning something with first letters
    }

  def done_summaries
    summaries.select do |summary|
      summary.status == "done"
    end
  end

end
