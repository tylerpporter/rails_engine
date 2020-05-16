FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Number.within(range: 1..10) }
    unit_price { Faker::Number.decimal(l_digits: 2, r_digits: 2)}
    created_at { Faker::Time.backward(days: 8, period: :evening) }
    updated_at { Faker::Time.backward(days: 8, period: :evening) }
    item { nil }
    invoice { nil }
  end
end
