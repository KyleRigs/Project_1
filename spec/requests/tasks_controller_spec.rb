require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { create(:user) }
  let!(:task) { create(:task, user: user) }

  before do
    sign_in user
  end

  describe "GET /tasks" do
    it "renders the index template with user's tasks" do
      get tasks_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(task.name)
    end
  end

  describe "GET /tasks/:id/edit" do
    it "renders the edit template" do
      get edit_task_path(task)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Edit Task")
    end
  end

  describe "POST /tasks" do
    context "with valid parameters" do
      let(:task_params) do
        { task: { name: "New Task", priority: "High", status: "Not Started", user_id: user.id } }
      end
  
      it "creates a new task and redirects" do
        expect {
          post tasks_path, params: task_params
        }.to change(Task, :count).by(1)
        expect(response).to redirect_to(tasks_path)
      end
    end
  end  

    context "with invalid parameters" do
      let(:invalid_params) { { task: { name: "", priority: "", status: "" } } }

      it "does not create a task and renders the index" do
        post tasks_path, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("error")
      end
    end

  describe "PATCH /tasks/:id" do
    context "with valid parameters" do
      it "updates the task and redirects" do
        patch task_path(task), params: { task: { name: "Updated Task" } }
        expect(response).to redirect_to(tasks_path)
        expect(task.reload.name).to eq("Updated Task")
      end
    end

    context "with invalid parameters" do
      it "does not update and renders the edit page" do
        patch task_path(task), params: { task: { name: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("error")
      end
    end
  end

  describe "DELETE /tasks/:id" do
    it "deletes the task and redirects" do
      expect {
        delete task_path(task)
      }.to change(Task, :count).by(-1)
      expect(response).to redirect_to(tasks_path)
    end
  end
end
