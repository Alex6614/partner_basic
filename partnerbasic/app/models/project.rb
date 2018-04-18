class Project < ApplicationRecord
  belongs_to :company
  belongs_to :group
  has_many :applications
end
