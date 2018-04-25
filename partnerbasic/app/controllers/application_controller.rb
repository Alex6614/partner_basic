# Application Controller
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

  def change_admin_status(user, club, status)
    return unless StudentToClub.exists?(user: user, club: club)
    student_to_club = StudentToClub.find_by(user: user, club: club)
    student_to_club.update_attributes(is_admin: status)
    redirect_to club
  end

  def check_admin_status(user, club)
    return false unless StudentToClub.exists?(user: user, club: club)
    student_to_club = StudentToClub.find_by(user: user, club: club)
    student_to_club.is_admin
  end

  def remove_current_user(user, club)
    club.remove_member(user)
    redirect_to club
  end
end
