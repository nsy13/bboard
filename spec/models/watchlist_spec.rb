require 'rails_helper'

RSpec.describe Watchlist, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:topic1) { create(:topic) }
  let(:topic2) { create(:topic) }
  let(:watchlist1) { Watchlist.new }
  let(:watchlist2) { Watchlist.new }

  before do
    watchlist1.user = user1
    watchlist1.topic = topic1
    watchlist2.user = user2
    watchlist2.topic = topic2
  end

  it "is valid with diffrent combination(user_id & topic_id)" do
    watchlist1.save!
    expect(watchlist2).to be_valid
  end
  it "is invalid with the same combination(user_id & topic_id)" do
    watchlist2.user = watchlist1.user
    watchlist2.topic = watchlist1.topic
    watchlist1.save!
    watchlist2.valid?
    expect(watchlist2.errors[:topic_id]).to include("はすでに存在します")
  end
end
