class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :fobid_login_user, only: [:show]
  before_action :logging_in_not_newly_registration, only: [:new]

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
end
