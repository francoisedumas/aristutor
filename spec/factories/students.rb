FactoryBot.define do
  factory :student do
    first_name      "Sophie"
    last_name       "Jambon"
    sequence(:email) { |n| "student#{n}@lewagon.com" }
    password        "azerty"
    sequence(:phone_number ) { |n| "01#{n}#{n}010101" }
    mother_language "FR"
  end
end
