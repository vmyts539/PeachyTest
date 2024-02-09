FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Book.publisher }
    association :user
  end
end
