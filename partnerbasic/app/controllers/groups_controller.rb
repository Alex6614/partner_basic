class GroupsController < ApplicationController
  before_action :set_club
  before_action :set_group, only: [:show, :edit, :update, :destroy, :add_group_member, :remove_group_member]
  helper_method :member?, :admin?

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group_members = @group.users
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_group_member
    @group.add_member(current_user)
    redirect_to club_group_path(@club, @group)
  end

  def remove_group_member
    @group.remove_member(current_user)
    redirect_to club_group_path(@club, @group)
  end

  private
    def admin?
      return false unless StudentToClub.exists?(user: current_user, club: @club)
      student_to_club = StudentToClub.find_by(user: current_user, club: @club)
      student_to_club.is_admin
    end

    def member?
      GroupToStudent.exists?(user: current_user, group: @group)
    end
    def set_club
      @club = Club.find(params[:club_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:club_id, :group_name)
    end
end
