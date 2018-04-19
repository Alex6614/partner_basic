class Review < ApplicationRecord
  belongs_to :club
  belongs_to :user

  validates :review_text, length: { minimum: 10 }
end
