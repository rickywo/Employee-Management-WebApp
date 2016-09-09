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

  # json.employee_name employee.name
  # json.team_name project.team.name
  # json.project_name project.name
  # json.employee_employment_type employee.employment_type
  # json.employee_hourly_rate employee.hourly_rate
  # json.employee_location employee.location
  # json.capitalizable_group_description employee.capitalizable_group.description
  # json.dedication_weight team_member.dedication_weight
  # json.result

  def get_result_rows
    @result = []
    @employees.each do |employee|
      employee.team_members.each do |team_member|
        team_member.team.projects.each do |project|

          result = calculate_capitalized_hour @this_iteration.work_day, employee.capitalizable_group.capitalizable_rate, employee.attendance_rate, team_member.dedication_weight, project.weight
          #p employee.name
          @result.append(Cap_result_row.new(employee.name,project.team.name,project.name,employee.employment_type,employee.hourly_rate,employee.location,employee.capitalizable_group.capitalizable_rate,team_member.dedication_weight,result.to_f))
          #p json
        end
      end
    end
    @result
  end


  def get_current_iteration
    return Iteration.where("start_date < ? AND end_date > ?", Time.now, Time.now).take
  end


  class Cap_result_row
    attr_accessor :employee_name, :team, :project, :employee_type, :hourly_rate, :location, :cap_weight, :dedication_weight, :cap_day
    def initialize(name, t, p, type, rate, loc, cap_wt, dedi_wt, cap_day)
      @employee_name = name
      @team = t
      @project = p
      @employee_type = type
      @hourly_rate = rate
      @location = loc
      @cap_weight = cap_wt
      @dedication_weight = dedi_wt
      @cap_day = cap_day
    end
  end

end
