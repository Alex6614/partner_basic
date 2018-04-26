class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :create_project, :company?, :company_owner?]
  helper_method :company?, :owner?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @company_projects = @user.projects
    @user_clubs = @user.clubs
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if in_clubs?
      respond_to do |format|
        format.html { redirect_to @user, notice: "Can't delete if you are still part of clubs" }
        format.json { head :no_content }
      end
    else
      @user.destroy
      reset_session
      redirect_to root_path
    end
  end

  def create_project
    @project = Project.new(user: @user, project_name: params['project_name'], complete: false)
    @project.save
    redirect_to @user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def in_clubs?
    StudentToClub.exists?(user: current_user)
  end

  def company?
    !@user.is_student
  end

  def owner?
    @user == current_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :name, :password_hash, :photo_link, :description, :is_student)
  end
end
