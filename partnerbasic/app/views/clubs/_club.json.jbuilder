json.extract! club, :id, :club_name, :university_name, :club_link, :description, :photo_link, :verified, :created_at, :updated_at
json.url club_url(club, format: :json)
