class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # skip_before_action :login_required
  before_action :admin_user

  def index
    @users = User.all.select(:id, :name, :email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # flash.now[:notice] = '作成に成功しました'
      redirect_to admin_users_path
    else
      flash.now[:notice] = '作成に失敗しました'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path, notice: "ユーザー情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "ユーザーをを削除しました"
    redirect_to admin_users_path
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
