class Company < ApplicationRecord
  has_many :projects
  has_many :reviews

  validates :company_name, presence: true, uniqueness: true
end
