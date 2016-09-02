json.extract! team_member, :id, :team_id, :employee_id, :dedication_weight, :created_at, :updated_at
json.url team_member_url(team_member, format: :json)