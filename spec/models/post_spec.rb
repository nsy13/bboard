require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post1) { create(:post) }
  let(:post2) { build(:post) }

  it "is valid with a content, user_id and topic_id" do
    expect(post2).to be_valid
  end
  it "is invalid without a content" do
    post2.content = nil
    post2.valid?
    expect(post2.errors[:content]).to include("を入力してください")
  end
  it "is invalid with over 300 letters content" do
    post2.content = "a" * 801
    post2.valid?
    expect(post2.errors[:content]).to include("は800文字以内で入力してください")
  end
  it "is valid with duplicate content" do
    post2.content = post1.content
    expect(post2).to be_valid
  end
end
