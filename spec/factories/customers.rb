FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name }
    created_at { Faker::Time.backward(days: 14, period: :evening) }
    updated_at { Faker::Time.backward(days: 14, period: :evening) }
  end
end
