class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.nil?
      redirect_to login_path
    elsif @user.password_hash == params[:password]
      session[:user_id] = @user.id
      session[:user_type] = @user.is_student
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
