# テストログイン用ユーザー

User.create!(name: "テスト太郎",
             email: "test@example.com",
             password: "password")
user = User.first

5.times do |n|
  user.topics.create!(name: "#{Faker::Game.title} について語るスレ")
end

# その他ユーザー

30.times do |n|
  User.create!(name: Faker::Name.name,
               email: "no.#{n + 1}-#{Faker::Internet.email}",
               password: "password")
end
