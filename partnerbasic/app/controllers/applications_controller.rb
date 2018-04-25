# Applications Controller
class ApplicationsController < ApplicationController
  before_action :set_user
  before_action :set_project
  before_action :set_application, only: %i[show edit update destroy
                                           accept_application
                                           reject_application]

  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
  end

  # GET /applications/1
  # GET /applications/1.json
  def show; end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit; end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html do
        redirect_to root_path,
                    notice: 'Application was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def accept_application
    @project.update_attributes(group: @application.group)
    @application.destroy
    redirect_to user_project_path(@user, @project)
  end

  def reject_application
    @application.destroy
    redirect_to user_project_path(@user, @project)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_application
    @application = Application.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:project_id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def application_params
    params.require(:application).permit(:text,
                                        :date_added, :group_id, :project_id)
  end
end
