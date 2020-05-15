FactoryBot.define do
  factory :invoice_item do
    quantity { 1 }
    unit_price { "9.99" }
    created_at { "MyString" }
    updated_at { "MyString" }
    item { nil }
    invoice { nil }
  end
end
