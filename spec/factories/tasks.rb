FactoryBot.define do
  factory :task do
    name { "Example Task" }
    priority { "Medium" }              # Matches validation
    status { "Not Started" }           # Matches validation
    association :user
  end
end
