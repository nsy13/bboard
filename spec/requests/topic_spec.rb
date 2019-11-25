require 'rails_helper'

RSpec.describe "Topics", type: :request do
  describe "GET topics#show" do
    let(:topic) { create(:topic) }

    it "shows returns http status 200" do
      get topic_path(topic)
      expect(response).to have_http_status(200)
    end
  end
end
