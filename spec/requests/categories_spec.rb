require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:category1) { create(:category, id: 2, name: "aaa") }
  let!(:category2) { create(:category, id: 1, name: "bbb") }
  let(:user) { create(:user) }
  let(:topic1) { build(:topic) }
  let(:topic2) { build(:topic) }
  let(:post) { build(:post) }

  before do
    topic1.user = user
    topic2.user = user
    topic1.save && topic2.save
    post.user = user
    post.topic = topic1
    post.save
    TopicCategory.create(topic_id: topic1.id, category_id: category1.id)
  end

  context "when user is admin_user" do
    before do
      user.admin = true
      user.save!
      sign_in(user)
    end

    describe "GET index" do
      before do
        get categories_path
      end

      it "returns http status 200" do
        expect(response).to have_http_status(200)
      end
      it "assigns @categories" do
        expect(assigns(:categories)).to eq [category1, category2]
      end
    end

    describe "GET new" do
      before do
        get new_category_path
      end

      it "returns http status 200" do
        expect(response).to have_http_status(200)
      end
    end

    describe "GET edit" do
      before do
        get edit_category_path(category1)
      end

      it "returns http status 200" do
        expect(response).to have_http_status(200)
      end
      it "assigns @category" do
        expect(assigns(:category)).to eq category1
      end
    end
  end

  context "when user is not admin_user" do
    describe "GET show" do
      before do
        get category_path(category1)
      end

      it "returns http status 200" do
        expect(response).to have_http_status(200)
      end
      it "assigns @categories" do
        expect(assigns(:categories)).to eq [category1, category2]
      end
      it "assigns @category" do
        expect(assigns(:category)).to eq category1
      end
      it "assigns @topics" do
        expect(assigns(:topics)).to eq [topic1]
      end
    end

    describe "user is not authorized to access admin method" do
      before do
        sign_in(user)
      end

      it "is not access index method" do
        get categories_path
        expect(response).to redirect_to root_path
      end
      it "is not access new method" do
        get new_category_path
        expect(response).to redirect_to root_path
      end
      it "is not access edit method" do
        get edit_category_path(category1)
        expect(response).to redirect_to root_path
      end
      it "is not access update method" do
        patch category_path(category1)
        expect(response).to redirect_to root_path
      end
      it "is not access destroy method" do
        delete category_path(category1)
        expect(response).to redirect_to root_path
      end
    end
  end
end
