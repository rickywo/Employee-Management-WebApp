json.array! @employees.each do |employee|
  employee.team_members.each do |team_member|
    team_member.team.projects.each do |project|

      result = calculate_capitalized_hour @iteration.find(7).work_day, employee.capitalizable_group.capitalizable_rate, 100, team_member.dedication_weight, project.weight
      #p employee.name
      json.employee_name employee.name
      json.team_name project.team.name
      json.project_name project.name
      json.employee_employment_type employee.employment_type
      json.employee_hourly_rate employee.hourly_rate
      json.employee_location employee.location
      json.capitalizable_group_description employee.capitalizable_group.description
      json.dedication_weight team_member.dedication_weight
      json.result result.to_f
      #p json
    end
  end
end