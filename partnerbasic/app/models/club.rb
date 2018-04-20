class Club < ApplicationRecord
  has_many :reviews
  has_many :student_to_clubs
  has_many :users, through: :student_to_clubs
  has_many :groups

  validates :club_name, uniqueness: { scope: :university_name }

  def add_member(user_id, is_admin)
    StudentToClub.create(club: self, user: user_id, is_admin: is_admin)
  end
end
