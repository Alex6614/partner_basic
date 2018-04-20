class Project < ApplicationRecord
  belongs_to :user
  belongs_to :group, required: false
  has_many :applications

  validates :project_name, uniqueness: { scope: :user_id }
  validates :project_name, presence: true
end
