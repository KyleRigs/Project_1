class Task < ApplicationRecord
  belongs_to :user  # Each task belongs to a user

  PRIORITY_ORDER = { "High" => 0, "Medium" => 1, "Low" => 2 }

  scope :ordered_by_priority, -> {
  order(Arel.sql("CASE
    WHEN priority = 'High' THEN #{PRIORITY_ORDER['High']}
    WHEN priority = 'Medium' THEN #{PRIORITY_ORDER['Medium']}
    WHEN priority = 'Low' THEN #{PRIORITY_ORDER['Low']}
    ELSE 3
  END"))
  }


  validates :name, presence: true, uniqueness: { scope: :user_id, message: "has already been taken for this user" }, length: { minimum: 2, maximum: 200 }
  validates :priority, inclusion: { in: [ "High", "Medium", "Low" ], message: "%{value} is not a valid priority" }
  validates :status, inclusion: { in: [ "Not Started", "In Progress", "On Hold", "Completed" ], message: "%{value} is not a valid status" }
end
