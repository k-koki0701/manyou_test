class UsersController < ApplicationController
  skip_before_action :login_required
  # before_action :fobid_login_user, only: [:show]
  before_action :logging_in_not_newly_registration, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def fobid_login_user
    if @current_user.id !=  params[:id].to_i
      redirect_to tasks_path
    end
  end

  def logging_in_not_newly_registration
    if current_user
      redirect_to tasks_path
    end
  end
end
