# テストログイン用ユーザー

User.create!(name: "Test-Tarou",
             email: "test@example.com",
             password: "password",
             admin: true)
user = User.first

10.times do |n|
  Category.create!(name: Faker::Color.unique.color_name)
end

10.times do |n|
  Category.create!(name: Faker::Commerce.unique.material)
end

10.times do |n|
  Category.create!(name: Faker::Music.unique.genre)
end

5.times do |n|
  topic = Topic.new(name: "#{ Faker::Games::Pokemon.name } について語るスレ")
  topic.user = user
  topic.save!
  3.times do |i|
    TopicCategory.create!(topic_id: topic.id, category_id: i + n + 10)
  end
  post = topic.posts.build(content: "これが記念すべき初めてのコメントです。みなさん徒然なるままに書き込んでください。")
  post.user = user
  post.save!
end

# その他ユーザー

20.times do |n|
  user = User.create!(name: Faker::Internet.username,
                      email: "no.#{ n + 2 }-#{ Faker::Internet.email }",
                      password: "password")
  topic = Topic.new(name: "#{ Faker::Music.band }総合スレ")
  topic.user = user
  topic.save!
  2.times do |i|
    TopicCategory.create!(topic_id: topic.id, category_id: i + n + 1)
  end
  post = topic.posts.build(content: "1st コメント")
  post.user = user
  post.save!
  10.times do |i|
    post = user.posts.build(content: "これは#{ user.name }による投稿！このスレッドは非常に興味深いです！みなさんの書き込みでさらに賑わうことを望んでいます！")
    post.topic = Topic.find(rand(1..5))
    post.save!
  end
  5.times do |i|
    watchlist = Watchlist.new
    watchlist.user = user
    watchlist.topic = Topic.find(i + n + 1)
    watchlist.save!
  end
end

user = User.first
20.times do |n|
  watchlist = user.watchlists.build
  watchlist.topic = Topic.find(n + 6)
  watchlist.save!
end

100.times do |n|
  user = User.find(rand(1..21))
  post = user.posts.build(content: "これはテスト文章です。同じ文章が並ぶことになってしまって味気ないかもしれないですが、お許しください。" * 2)
  post.topic = Topic.find(rand(6..25))
  post.save!
end
