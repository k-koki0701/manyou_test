class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]

  def index
    @tasks = Task.all.order(id: "DESC")
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to new_task_path
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:task_name, :task_detail)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
