json.extract! student, :id, :email, :first_name, :last_name, :password_hash, :photo_link, :created_at, :updated_at
json.url student_url(student, format: :json)
