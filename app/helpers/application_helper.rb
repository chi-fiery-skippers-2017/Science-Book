module ApplicationHelper

  def logged_in?
    current_user != nil
  end

  def current_user
    @_current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

end
