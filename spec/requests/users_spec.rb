require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET users#show" do
    let(:user) { create(:user) }

    it "shows returns http status 200" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
