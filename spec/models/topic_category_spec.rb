require 'rails_helper'

RSpec.describe TopicCategory, type: :model do
  let(:category1) { create(:category) }
  let(:category2) { create(:category) }
  let(:topic1) { create(:topic) }
  let(:topic2) { create(:topic) }
  let(:topic_category1) { TopicCategory.new }
  let(:topic_category2) { TopicCategory.new }

  before do
    topic_category1.category = category1
    topic_category1.topic = topic1
    topic_category2.category = category2
    topic_category2.topic = topic2
  end

  it "is valid with diffrent combination(topic_id & category_id)" do
    topic_category1.save
    expect(topic_category2).to be_valid
  end
  it "is invalid with duplicate combination(topic_id & category_id)" do
    topic_category2.category = topic_category1.category
    topic_category2.topic = topic_category1.topic
    topic_category1.save
    topic_category2.valid?
    expect(topic_category2.errors[:topic_id]).to include("はすでに存在します")
  end
end
