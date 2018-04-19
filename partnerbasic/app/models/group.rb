class Group < ApplicationRecord
  belongs_to :club
  has_many :users, through: :group_to_students
  has_many :applications
  has_many :projects

  validates :group_name, uniqueness: { scope: :club_id }
  validates :group_name, presence: true
end
