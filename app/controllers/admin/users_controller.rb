class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all.select(:id, :name, :email, :admin).order(created_at: "ASC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
      flash.now[:notice] = '作成に成功しました'
    else
      flash.now[:notice] = '作成に失敗しました'
      render :new
    end
  end

  def show
    @tasks = @user.tasks
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path, notice: "ユーザー情報を編集しました！"
    else
      redirect_to admin_user_path, notice: "管理者いなくなるので無理です"
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to admin_users_path
    else
      redirect_to admin_users_path
      flash[:notice] = "管理者いなくなるので無理です"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    unless current_user.admin?
      redirect_to tasks_path
      flash[:notice] = '権限のないユーザーです'
    end
  end
end
