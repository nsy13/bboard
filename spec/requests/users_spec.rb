require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET users#show" do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:topic1) { create(:topic, user_id: user1.id, updated_at: Time.current) }
    let(:topic2) { create(:topic, user_id: user2.id, updated_at: Time.current - 1.day) }
    let!(:post1) { create(:post, user_id: user1.id, topic_id: topic1.id) }
    let!(:post2) { create(:post, user_id: user1.id, topic_id: topic2.id) }
    let!(:category1) { create(:category, name: "bbb") }
    let!(:category2) { create(:category, name: "aaa") }

    before do
      sign_in(user1)
      get user_path(user1)
    end

    it "shows returns http status 200" do
      expect(response).to have_http_status(200)
    end
    it "assigns @user" do
      expect(assigns(:user)).to eq user1
    end
    it "assigns @topics" do
      expect(assigns(:topics)).to eq [topic1]
    end
  end
end
