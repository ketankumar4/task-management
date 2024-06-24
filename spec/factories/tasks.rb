FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    status { 1 }
    deadline { "2024-06-24 20:33:33" }
    user { nil }
  end
end
