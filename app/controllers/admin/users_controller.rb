class Admin::UsersController < ApplicationController
  skip_before_action :login_required

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  end
end
