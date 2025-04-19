require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  include Devise::Test::IntegrationHelpers  # ✅ This is required for `sign_in` to work in request specs

  let(:user) { User.create!(email: "user@example.com", password: "password", password_confirmation: "password") }
before do
  puts user.inspect  # Debugging line to see if user is created properly
  sign_in user
end

  describe "GET /index" do
    it "returns http success" do
      get "/dashboard/index"
      expect(response).to have_http_status(:success)
    end
  end
end
