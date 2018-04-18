class Review < ApplicationRecord
  belongs_to :club
  belongs_to :company

  validates :review_text, length: { minimum: 10 }
end
