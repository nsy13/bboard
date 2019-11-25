FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyString" }
    user { nil }
    topic { nil }
  end
end
