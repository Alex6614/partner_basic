class User < ApplicationRecord
  has_many :student_to_clubs
  has_many :group_to_students
  has_many :clubs, through: :student_to_clubs
  has_many :groups, through: :group_to_students
  has_many :projects

  validates :email, presence: true, uniqueness: true
end
