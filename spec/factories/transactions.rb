FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Number.number(digits: 16) }
    credit_card_expiration_date { nil }
    result { "Success" }
    created_at { Faker::Time.backward(days: 14, period: :evening) }
    updated_at { Faker::Time.backward(days: 14, period: :evening) }
    invoice { nil }
  end
end
