# テストログイン用ユーザー

User.create!(name: "Test-Tarou",
             email: "test@example.com",
             password: "password")
user = User.first

20.times do |n|
  Category.create!(name: Faker::Games::Pokemon.unique.name)
end

5.times do |n|
  topic = user.topics.create!(name: "#{Faker::Game.title} について語るスレ")
  3.times do |i|
    TopicCategory.create!(topic_id: topic.id, category_id: rand(1..20))
  end
  post = topic.posts.build(content: "1st コメント")
  post.user = user
  post.save!
end

# その他ユーザー

30.times do |n|
  User.create!(name: Faker::Internet.username,
               email: "no.#{n + 2}-#{Faker::Internet.email}",
               password: "password")
  user = User.find(n + 2)
  topic = user.topics.create!(name: "#{Faker::Music.band}総合スレ")
  2.times do |i|
    TopicCategory.create!(topic_id: topic.id, category_id: rand(1..20))
  end
  post = topic.posts.build(content: "1st コメント")
  post.user = user
  post.save!
  10.times do |j|
    post = user.posts.build(content: Faker::Lorem.sentence)
    post.topic = Topic.find(rand(1..5))
    post.save!
  end
end

100.times do |n|
  user = User.find(rand(1..31))
  post = user.posts.build(content: Faker::Lorem.sentence)
  post.topic = Topic.find(rand(6..35))
  post.save!
end
