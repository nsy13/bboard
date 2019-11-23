require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /homes" do
    it "shows returns http status 200" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
