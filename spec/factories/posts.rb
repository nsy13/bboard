FactoryBot.define do
  factory :post do
    content { "私は#{Faker::Games::Pokemon.name}が好きです" }
    association :user
    association :topic
  end
end
