# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  # GET /tasks
  def index
    @tasks = Task.all
    @task = Task.new
  end

  # GET /tasks/:id/edit
  def edit
    # @task is already set by the set_task method
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      @tasks = Task.all
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
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_path, notice: "Task was successfully deleted."
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name)
    end
end
