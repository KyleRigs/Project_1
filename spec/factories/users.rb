FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password123" }
    password_confirmation { "password123" }  # Ensures password confirmation matches
  end
end
