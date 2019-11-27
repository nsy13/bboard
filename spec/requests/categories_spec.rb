require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET categories#show" do
    let(:category) { create(:category) }
    let(:user) { create(:user) }
    let(:topic) { build(:topic) }
    let(:post) { build(:post) }

    before do
      topic.user = user
      topic.save
      post.user = user
      post.topic = topic
      post.save
      TopicCategory.create(topic_id: topic.id, category_id: category.id)
    end

    it "shows returns http status 200" do
      get category_path(category)
      expect(response).to have_http_status(200)
    end
  end
end
