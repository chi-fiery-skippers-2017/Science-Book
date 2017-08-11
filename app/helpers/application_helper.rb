module ApplicationHelper

  def logged_in?
    current_user != nil
  end

  def is_admin?
    current_user && current_user.role == "admin"
  end

  def current_user
    @_current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def authenticate!
    redirect_to root_path if current_user == nil
  end

  def authorize_admin!
    redirect_to root_path if !is_admin?
  end

  def authorize!(user)
    redirect_to root_path unless user == current_user || is_admin?
  end

end
