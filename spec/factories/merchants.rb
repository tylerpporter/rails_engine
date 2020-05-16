FactoryBot.define do
  factory :merchant do
    name { Faker::TvShows::GameOfThrones.character }
    created_at { Faker::Time.backward(days: 19, period: :evening) }
    updated_at { Faker::Time.backward(days: 19, period: :evening) }
  end
end
