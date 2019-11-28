require 'rails_helper'

RSpec.describe "Topics", type: :request do
  let(:user) { create(:user) }
  let(:topic1) { create(:topic, user_id: user.id, updated_at: Time.current) }
  let(:topic2) { create(:topic, user_id: user.id, updated_at: Time.current - 1.day) }
  let!(:post1) { create(:post, user_id: user.id, topic_id: topic1.id) }
  let!(:post2) { create(:post, user_id: user.id, topic_id: topic2.id) }
  let!(:category1) { create(:category, name: "bbb") }
  let!(:category2) { create(:category, name: "aaa") }

  describe "GET index" do
    before do
      get topics_path
    end

    it "returns http status 200" do
      expect(response).to have_http_status(200)
    end
    it "assigns @topics" do
      expect(assigns(:topics)).to eq [topic1, topic2]
    end
    it "assigns @categories" do
      expect(assigns(:categories)).to eq [category2, category1]
    end
  end

  describe "GET show" do
    before do
      TopicCategory.create(topic_id: topic1.id, category_id: category1.id)
      TopicCategory.create(topic_id: topic2.id, category_id: category2.id)
      get topic_path(topic1)
    end

    it "shows returns http status 200" do
      expect(response).to have_http_status(200)
    end
    it "assigns @topic" do
      expect(assigns(:topic)).to eq topic1
    end
    it "assigns @categories" do
      expect(assigns(:categories)).to eq [category1]
    end
    it "assigns @posts" do
      expect(assigns(:posts)).to eq [post1]
    end
  end
end
