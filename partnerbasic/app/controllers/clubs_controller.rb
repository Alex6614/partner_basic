# Controller for clubs
class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy, :add_club_member, :remove_current_user, :remove_club_member, :create_group, :make_admin, :delete_admin]
  helper_method :admin?, :adminv2?, :member?, :only_admin?

  def index
    @clubs = Club.all
  end

  def show; end

  def new
    @club = Club.new
  end

  def edit; end

  def create
    @club = Club.new(club_params)
    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        form_with_error(format, @club.errors)
      end
    end
    @club.add_member(current_user, true)
  end

  def form_with_error(format, errors)
    format.html { render :new }
    format.json { render json: errors, status: :unprocessable_entity }
  end

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

  def destroy
    @club.destroy
    redirect_to clubs_url
  end

  def add_club_member
    @club.add_member(current_user, false)
    redirect_to @club
  end

  def remove_club_member
    if only_admin? && admin?
      if applications? || projects?
        format_redirect_helper('Club still has pending or unfinished applications', @club)
      else
        @club.destroy
        format_redirect_helper('Club was successfully destroyed.', clubs_url)
      end
    else
      remove_current_user(current_user, @club)
    end
  end

  def format_redirect_helper(notice, redirect_target)
    respond_to do |format|
      format.html { redirect_to redirect_target, notice: notice }
      format.json { head :no_content }
    end
  end

  def create_group
    @group = Group.new(club: @club, group_name: params['group_name'])
    @group.save
    redirect_to @club
  end

  def make_admin
    change_admin_status(params['member'], @club, true)
  end

  def delete_admin
    change_admin_status(params['member'], @club, false)
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
    check_admin_status(current_user, @club)
  end

  def adminv2?(user)
    check_admin_status(user, @club)
  end

  def member?
    StudentToClub.exists?(user: current_user, club: @club)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_club
    @club = Club.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def club_params
    params.require(:club).permit(:club_name, :university_name, :club_link, :description, :photo_link, :verified)
  end
end
