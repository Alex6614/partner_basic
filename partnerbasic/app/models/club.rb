class Club < ApplicationRecord
  has_many :reviews
  has_many :students, through: :student_to_clubs
  has_many :groups

  validates :club_name, uniqueness: { scope: :university_name }
end
