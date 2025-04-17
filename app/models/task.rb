# app/models/task.rb
class Task < ApplicationRecord
  belongs_to :user  # Each task belongs to a user

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :priority, inclusion: { in: [ "High", "Medium", "Low" ], message: "%{value} is not a valid priority" }
  validates :status, inclusion: { in: [ "Not Started", "In Progress", "On Hold", "Completed" ], message: "%{value} is not a valid status" }
end
