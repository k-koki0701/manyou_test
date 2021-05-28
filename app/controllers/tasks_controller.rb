class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to new_task_path
  end

  private
  task_params
    params.require(:task).permit(:task_name, :task_detail)
  end
end
