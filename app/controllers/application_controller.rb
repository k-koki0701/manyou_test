class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required
  private
  def login_required
    redirect_to new_session_path unless current_user
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
