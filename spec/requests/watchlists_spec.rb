require 'rails_helper'

RSpec.describe "watchlists", type: :request do
  describe "GET watchlists#index" do
    let(:user) { create(:user) }
    let(:topic1) { create(:topic, user_id: user.id, updated_at: Time.current) }
    let(:topic2) { create(:topic, user_id: user.id, updated_at: Time.current - 1.day) }
    let!(:post1) { create(:post, user_id: user.id, topic_id: topic1.id) }
    let!(:post2) { create(:post, user_id: user.id, topic_id: topic2.id) }
    let!(:category1) { create(:category, name: "bbb") }
    let!(:category2) { create(:category, name: "aaa") }
    let!(:watchlist) { Watchlist.create(user_id: user.id, topic_id: topic1.id) }

    before do
      get watchlists_path
    end

    it "shows returns http status 200" do
      expect(response).to have_http_status(200)
    end
    it "assigns @categories" do
      expect(assigns(:categories)).to eq [category2, category1]
    end
  end
end
