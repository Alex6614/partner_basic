json.extract! project, :id, :user_id, :project_name, :description, :group_id, :created_at, :updated_at
json.url project_url(project, format: :json)
