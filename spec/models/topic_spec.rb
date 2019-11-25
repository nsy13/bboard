require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic1) { create(:topic) }
  let(:topic2) { build(:topic) }

  it "is valid with a name and user_id" do
    expect(topic2).to be_valid
  end
  it "is invalid without a name" do
    topic2.name = nil
    topic2.valid?
    expect(topic2.errors[:name]).to include("を入力してください")
  end
  it "is invalid with over 300 letters name" do
    topic2.name = "a" * 301
    topic2.valid?
    expect(topic2.errors[:name]).to include("は300文字以内で入力してください")
  end
  it "is valid with duplicate name" do
    topic2.name = topic1.name
    expect(topic2).to be_valid
  end
end
