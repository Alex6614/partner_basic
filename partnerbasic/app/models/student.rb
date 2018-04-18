class Student < ApplicationRecord
  has_many :clubs, through: :student_to_clubs
  has_many :groups, through: :group_to_students
end
