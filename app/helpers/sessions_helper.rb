module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    current_user.present?
  end
  def to_login_screen(user)
    session[:user_id] = user.id
  end
end
