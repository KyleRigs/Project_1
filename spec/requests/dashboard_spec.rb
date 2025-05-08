require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  include Devise::Test::IntegrationHelpers  # ✅ This is required for `sign_in` to work in request specs

  let(:user) { User.create!(email: "user@example.com", password: "password", password_confirmation: "password") }

  before do
    sign_in user  # Sign in before running the test
  end

  describe "GET /dashboard" do
    it "returns http success" do
      get dashboard_path  # ✅ Using named route helper
      expect(response).to have_http_status(:success)  # Check if response is successful
    end
  end
end
