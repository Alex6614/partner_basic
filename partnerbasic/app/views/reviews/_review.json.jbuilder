json.extract! review, :id, :club_id, :user_id, :review_text, :created_at, :updated_at
json.url review_url(review, format: :json)
