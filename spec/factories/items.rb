FactoryBot.define do
  factory :item do
    name { Faker::TvShows::StrangerThings.character }
    description { Faker::Quotes::Rajnikanth.joke }
    unit_price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    merchant { nil }
    created_at { Faker::Time.backward(days: 6, period: :evening)}
    updated_at { Faker::Time.backward(days: 6, period: :evening) }
  end
end
