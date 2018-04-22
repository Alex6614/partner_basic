class StudentToClub < ApplicationRecord
  belongs_to :club
  belongs_to :user
  validates :club, presence: true
  validates :user, presence: true
end
