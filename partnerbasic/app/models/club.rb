class Club < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :student_to_clubs, dependent: :destroy
  has_many :users, through: :student_to_clubs
  has_many :groups, dependent: :destroy

  validates :club_name, uniqueness: { scope: :university_name }, allow_blank: false, presence: true

  def add_member(user_id, is_admin)
    StudentToClub.create(club: self, user: user_id, is_admin: is_admin)
  end

  def remove_member(user_id)
    relationship = StudentToClub.find_by(user: user_id, club: self)
    relationship.destroy
    groups.each { |group| GroupToStudent.where(user: user_id, group: group).destroy_all }
  end
end
