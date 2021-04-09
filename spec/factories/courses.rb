FactoryBot.define do
  factory :course do
    # course is linked to teacher and student in order to exist
    association :teacher
    association :student
    class_language "EN"
  end
end
