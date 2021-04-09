FactoryBot.define do
  factory :teacher do
    first_name "John"
    last_name  "Doe"
    sequence(:email) { |n| "tester#{n}@lewagon.com" }
    password "dottle-nouveau-pavilion-tights-furze"
  end
end
