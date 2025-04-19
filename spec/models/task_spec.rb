# spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { User.create!(email: "user@example.com", password: "password") } # Create a dummy user

  describe "validations" do
    # Test: Invalid if the task does not have a name
    it "is invalid without a name" do
      task = Task.new(name: "", user: user)
      expect(task).not_to be_valid
      expect(task.errors[:name]).to include("can't be blank")
    end
    # Test: Task with all valid attributes is valid
    it "is valid with valid attributes" do
      task = Task.new(name: "Valid Task", user: user, priority: "High", status: "Not Started")
      expect(task).to be_valid
    end


    # Test: Invalid if the task name is shorter than 2 characters
    it "is invalid with a name shorter than 2 characters" do
      task = Task.new(name: "A", user: user)
      expect(task).not_to be_valid
      expect(task.errors[:name]).to include("is too short (minimum is 2 characters)")
    end

    # Test: Invalid if the task name exceeds 200 characters
    it "is invalid if the name exceeds 200 characters" do
      long_name = "A" * 201
      task = Task.new(name: long_name, user: user, priority: "High", status: "Not Started")
      expect(task).not_to be_valid
      expect(task.errors[:name]).to include("is too long (maximum is 200 characters)")
    end

    # Test: Task name should be unique per user
    it "is invalid with a duplicate name for the same user" do
      Task.create!(name: "Unique Task", user: user, priority: "High", status: "Not Started")
      duplicate_task = Task.new(name: "Unique Task", user: user, priority: "High", status: "Not Started")
      expect(duplicate_task).not_to be_valid
      expect(duplicate_task.errors[:name]).to include("has already been taken for this user")
    end
  end

  describe "associations" do
    # Test: When a user is deleted, their associated tasks should also be deleted
    it "deletes associated tasks when the user is deleted" do
      user_with_task = User.create!(email: "test@example.com", password: "password")
      Task.create!(name: "Delete Me", user: user_with_task, status: "Not Started", priority: "High")
      expect { user_with_task.destroy }.to change { Task.count }.by(-1)
    end
  end

  describe ".ordered_by_priority" do
    # Test: Tasks should be sorted with High priority first, then Medium, then Low
    it "returns tasks sorted with High priority first, then Medium, then Low" do
      high = Task.create!(name: "High Task", priority: "High", status: "Not Started", user: user)
      medium = Task.create!(name: "Medium Task", priority: "Medium", status: "Not Started", user: user)
      low = Task.create!(name: "Low Task", priority: "Low", status: "Not Started", user: user)

      ordered = Task.ordered_by_priority

      expect(ordered.first).to eq(high)
      expect(ordered.second).to eq(medium)
      expect(ordered.third).to eq(low)
    end
  end
end
