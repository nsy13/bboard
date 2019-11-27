require 'rails_helper'

RSpec.describe "watchlists", type: :request do
  describe "GET watchlists#index" do
    let(:user) { create(:user) }
    let(:topic) { build(:topic) }
    let(:post) { build(:post) }
    let(:watchlist) { Watchlist.new }

    before do
      topic.user = user
      topic.save
      post.user = user
      post.topic = topic
      post.save
      watchlist.user = user
      watchlist.topic = topic
      watchlist.save
    end

    it "shows returns http status 200" do
      get watchlists_path
      expect(response).to have_http_status(200)
    end
  end
end
