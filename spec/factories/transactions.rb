FactoryBot.define do
  factory :transaction do
    credit_card_number { 1 }
    credit_card_expiration_date { "MyString" }
    result { "MyString" }
    created_at { "MyString" }
    updated_at { "MyString" }
    invoice { nil }
  end
end
