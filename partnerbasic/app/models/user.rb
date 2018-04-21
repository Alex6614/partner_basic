class User < ApplicationRecord
  include BCrypt
  has_many :student_to_clubs
  has_many :group_to_students
  has_many :clubs, through: :student_to_clubs
  has_many :groups, through: :group_to_students
  has_many :projects

  validates :email, presence: true, uniqueness: true
  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
end
