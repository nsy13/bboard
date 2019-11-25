# テストログイン用ユーザー

User.create!(name: "Test-Tarou",
             email: "test@example.com",
             password: "password")
user = User.first

5.times do |n|
  user.topics.create!(name: "#{Faker::Game.title} について語るスレ")
end

# その他ユーザー

30.times do |n|
  User.create!(name: Faker::Internet.username,
               email: "no.#{n + 2}-#{Faker::Internet.email}",
               password: "password")
  user = User.find(n + 2)
  user.topics.create!(name: "#{Faker::Music.band}総合スレ")
end
