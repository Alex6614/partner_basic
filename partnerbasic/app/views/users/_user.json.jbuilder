json.extract! user, :id, :email, :name, :password_hash, :photo_link, :description, :is_student, :created_at, :updated_at
json.url user_url(user, format: :json)
