# json.array! @employees.each do |employee|
#   employee.team_members.each do |team_member|
#     team_member.team.projects.each do |project|
#
#       result = calculate_capitalized_hour @iteration.find(7).work_day, employee.capitalizable_group.capitalizable_rate, 100, team_member.dedication_weight, project.weight
#       #p employee.name
#       json.employee_name employee.name
#       json.team_name project.team.name
#       json.project_name project.name
#       json.employee_employment_type employee.employment_type
#       json.employee_hourly_rate employee.hourly_rate
#       json.employee_location employee.location
#       json.capitalizable_group_description employee.capitalizable_group.description
#       json.dedication_weight team_member.dedication_weight
#       json.result result.to_f
#       #p json
#     end
#   end
# end

json.array! get_result_rows.each do |rows|
  #attr_accessor :employee_name, :team, :project, :employee_type, :hourly_rate, :location, :cap_weight, :dedication_weight, :cap_day

  #p employee.name
      json.employee_name rows.employee_name
      json.team_name rows.team
      json.project_name rows.project
      json.date rows.date
      json.employee_employment_type rows.employee_type
      json.employee_hourly_rate rows.hourly_rate
      json.employee_location rows.location
      json.capitalizable_group_description rows.cap_weight
      json.dedication_weight rows.dedication_weight
      json.result rows.cap_hour
      #p json
end