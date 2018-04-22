class Review < ApplicationRecord
  belongs_to :club
  belongs_to :user, required: false

  validates :review_text, length: { minimum: 1 }
end
