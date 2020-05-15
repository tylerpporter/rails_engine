FactoryBot.define do
  factory :invoice do
    status { "MyString" }
    created_at { "MyString" }
    updated_at { "MyString" }
    customer { nil }
    merchant { nil }
  end
end
