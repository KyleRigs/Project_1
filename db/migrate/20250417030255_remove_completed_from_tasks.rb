class RemoveCompletedFromTasks < ActiveRecord::Migration[8.0]
  def change
    remove_column :tasks, :completed, :boolean
  end
end
