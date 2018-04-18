class Project < ApplicationRecord
  belongs_to :company
  belongs_to :group
  has_many :applications

  validates :project_name, uniqueness: { scope: :company_id }
  validates :project_name, presence: true
end
