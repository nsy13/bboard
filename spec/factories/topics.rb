FactoryBot.define do
  factory :topic do
    name { "#{Faker::Music.band}を語るスレ" }
    association :user
  end
end
