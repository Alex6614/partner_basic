class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :is_student?, :current_user

  def logged_in?
    session[:user_id]
  end

  def is_student?
    session[:user_typw]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  def authenticate_user
    redirect_to root_path unless logged_in?
  end
end
