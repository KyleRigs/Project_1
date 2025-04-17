# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  before_action :authenticate_user!  # Ensure user is logged in
  before_action :set_task, only: %i[edit update destroy]

  # GET /tasks
  def index
    @tasks = current_user.tasks  # Only show tasks belonging to the current user
    @task = Task.new
  end

  # GET /tasks/:id/edit
  def edit
    # @task is already set by the set_task method (ensures only user tasks can be edited)
  end

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)  # Associate task with current user
    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      @tasks = current_user.tasks  # Display only the user's tasks on failure
      render :index, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/:id
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy  # Destroy the task associated with the logged-in user
    redirect_to tasks_path, notice: "Task was successfully deleted."
  end

  private

    def set_task
      @task = current_user.tasks.find(params[:id])  # Find task for the current user
    end

    def task_params
      params.require(:task).permit(:name, :priority, :status)
    end
end
