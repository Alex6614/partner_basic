class Group < ApplicationRecord
  belongs_to :club
  has_many :students, through: :group_to_students
  has_many :applications
  has_many :projects
end
