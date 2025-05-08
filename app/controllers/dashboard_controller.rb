# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  def index
    @tasks = current_user.tasks
    @total_tasks = @tasks.count
    @completed_tasks = @tasks.where(status: "Completed").count
    @in_progress_tasks = @tasks.where(status: "In Progress").count
  end
end
