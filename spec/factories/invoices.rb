FactoryBot.define do
  factory :invoice do
    status { "Shipped" }
    created_at { Faker::Time.backward(days: 11, period: :evening) }
    updated_at { Faker::Time.backward(days: 11, period: :evening) }
    customer { nil }
    merchant { nil }
  end
end
