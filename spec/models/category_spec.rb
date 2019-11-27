require 'rails_helper'

RSpec.describe Category, type: :model do
  let (:category1) { create(:category) }
  let (:category2) { build(:category) }

  it "is valid with different name" do
    expect(category2).to be_valid
  end
  it "is invalid with dupplicate name" do
    category2.name = category1.name
    category2.valid?
    expect(category2.errors[:name]).to include("はすでに存在します")
  end
  it "is invalid with over 30 letters name" do
    category2.name = "a" * 31
    category2.valid?
    expect(category2.errors[:name]).to include("は30文字以内で入力してください")
  end
end
