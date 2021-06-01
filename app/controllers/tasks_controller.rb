class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.order(created_at: "DESC")
    if params[:sort_expired]
      @tasks = Task.order('end_period DESC')
    elsif params[:sort_priority]
      @tasks = Task.order('priority ASC')
    elsif params[:task_name].present? && params[:status].present?
      @tasks = Task.search_task_name("%#{params[:task_name]}%").search_status(params[:status])
    elsif params[:task_name].present?
      @tasks = Task.search_task_name("%#{params[:task_name]}%")
    elsif params[:status].present?
      @tasks = Task.search_status(params[:status])
    else
      @tasks = Task.all.order(created_at: "DESC")
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
  if @task.save
    flash[:notice] = "タスクを登録しました"
    redirect_to tasks_path
  else
    render :new
  end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "タスクを編集しました"
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:task_name, :task_detail, :end_period, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
