json.extract! project, :id, :name, :status, :is_capitalizable, :weight, :release_date, :description, :team_id, :created_at, :updated_at
json.url project_url(project, format: :json)