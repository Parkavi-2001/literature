class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :is_admin?
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  def logged_in?
    !!current_user
  end
  def is_admin?
    logged_in? ? current_user.admin : false
  end
end
