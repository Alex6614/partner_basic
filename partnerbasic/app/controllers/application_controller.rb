class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :student?, :current_user

  def logged_in?
    if !User.exists?(id: session[:user_id])
      false
    else
      session[:user_id]
    end
  end

  def student?
    session[:user_type]
  end

  def current_user
    if !User.exists?(id: session[:user_id])
      reset_session
    elsif logged_in?
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authenticate_user
    redirect_to root_path unless logged_in?
  end
end
