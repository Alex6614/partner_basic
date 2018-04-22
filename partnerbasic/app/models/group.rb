class Group < ApplicationRecord
  belongs_to :club
  has_many :group_to_students, dependent: :destroy
  has_many :users, through: :group_to_students
  has_many :applications, dependent: :destroy
  has_many :projects

  validates :group_name, uniqueness: { scope: :club_id }
  validates :group_name, presence: true

  def add_member(user_id)
    return unless StudentToClub.exists?(user: user_id, club: club_id)
    GroupToStudent.create(group: self, user: user_id)
  end

  def remove_member(user_id)
    relationship = GroupToStudent.find_by(user: user_id, group: self)
    relationship.destroy
  end

  def full_name
    club.club_name + ': ' + group_name
  end
end
