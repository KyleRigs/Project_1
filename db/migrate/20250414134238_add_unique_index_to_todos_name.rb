class AddUniqueIndexToTasksName < ActiveRecord::Migration[7.1] # adjust version if needed
  def change
    add_index :tasks, :name, unique: true
  end
end
