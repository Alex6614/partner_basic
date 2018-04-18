class Application < ApplicationRecord
  belongs_to :group
  belongs_to :project

  validates :group_id, uniqueness: { scope: :project_id }
end
