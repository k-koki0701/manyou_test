class AddIndexTasksTaskName < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, :task_name, name: "index_tasks_on_task_name"
  end
end
