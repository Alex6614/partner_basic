class Club < ApplicationRecord
  has_many :reviews
  has_many :students, through: :student_to_clubs
  has_many :groups
end
