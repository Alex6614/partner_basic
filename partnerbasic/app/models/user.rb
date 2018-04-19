class User < ApplicationRecord
  has_many :clubs, through: :student_to_clubs
  has_many :groups, through: :group_to_students

  validates :email, presence: true, uniqueness: true
end
