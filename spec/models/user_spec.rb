require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(email: "test@example.com", password: "password", name: "Test User")
    expect(user).to be_valid
  end

  it "is valid with a name and email" do
    user = User.new(email: "test@example.com", password: "password", name: "Test User")
    expect(user).to be_valid
  end

  it "is invalid with a duplicate email" do
    User.create!(email: "test@example.com", password: "password", name: "Test User")
    user = User.new(email: "test@example.com", password: "password", name: "Test User")
    expect(user).to_not be_valid
  end
end
