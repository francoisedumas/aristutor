class TeacherLanguage < ApplicationRecord
  LANGUAGES = %w[FR EN ES PT]

  belongs_to :teacher
end
