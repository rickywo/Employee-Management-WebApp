module CapHourCalculationHelper
  # work_days: the actual work days of a specific Duration
  # capitalizable_rate: the capitalizable percentage of an employee
  # attendance_rate: the percentage of a week an employee worked (E.g. 3 or 4 days a week.)
  # dedication_rate: the dedication rate of an employee in a team
  # project_weight: the weight of project of a specific team

  def calculate_capitalized_hour(work_days, capitalizable_rate, attendance_rate, dedication_rate, project_weight)
    return work_days * (capitalizable_rate/100.0) * (attendance_rate/100.0) * (dedication_rate/100.0) * (project_weight/100.0)
  end

  #result = calculate_capitalized_hour 10, 100, 100, 100, 0.5

end
