class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy, :add_club_member, :remove_club_member, :create_group, :make_admin, :delete_admin]
  helper_method :admin?, :adminv2?, :member?, :only_admin?

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @club_members = @club.users
    @club_groups = @club.groups
    @club_reviews = @club.reviews
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
    @club.add_member(current_user, true)
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_club_member
    @club.add_member(current_user, false)
    redirect_to @club
  end

  def remove_club_member
    if only_admin? && admin?
      if applications?
        respond_to do |format|
          format.html { redirect_to @club, notice: 'Club still has pending applications' }
          format.json { head :no_content }
        end
      elsif projects?
        respond_to do |format|
          format.html { redirect_to @club, notice: 'Club still has unfinished projects' }
          format.json { head :no_content }
        end
      else
        @club.destroy
        respond_to do |format|
          format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    else
      @club.remove_member(current_user)
      redirect_to @club
    end
  end

  def create_group
    @group = Group.new(club: @club, group_name: params['group_name'])
    @group.save
    redirect_to @club
  end

  def make_admin
    return unless StudentToClub.exists?(user: params['member'], club: @club)
    student_to_club = StudentToClub.find_by(user: params['member'], club: @club)
    student_to_club.update_attributes(is_admin: true)
    redirect_to @club
  end

  def delete_admin
    return unless StudentToClub.exists?(user: params['member'], club: @club)
    student_to_club = StudentToClub.find_by(user: params['member'], club: @club)
    student_to_club.update_attributes(is_admin: false)
    redirect_to @club
  end

  private
    def projects?
      @club.groups.any? { |group| Project.exists?(group: group, complete: false) }
    end
    def applications?
      @club.groups.any? { |group| Application.exists?(group: group) }
    end
    def only_admin?
      StudentToClub.select { |m| m.is_admin && m.club == @club }.size == 1 && admin?
    end

    def admin?
      return false unless StudentToClub.exists?(user: current_user, club: @club)
      student_to_club = StudentToClub.find_by(user: current_user, club: @club)
      student_to_club.is_admin
    end

    def adminv2?(user)
      return false unless StudentToClub.exists?(user: user, club: @club)
      student_to_club = StudentToClub.find_by(user: user, club: @club)
      student_to_club.is_admin
    end

    def member?
      StudentToClub.exists?(user: current_user, club: @club)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:club_name, :university_name, :club_link, :description, :photo_link, :verified)
    end
end
