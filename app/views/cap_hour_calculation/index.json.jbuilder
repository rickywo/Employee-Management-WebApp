json.array! @results.each do |rows|
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