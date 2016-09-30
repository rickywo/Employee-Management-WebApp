module CapitalizationCalculator
  # work_days: the actual work days of a specific Duration
  # capitalizable_rate: the capitalizable percentage of an employee
  # attendance_rate: the percentage of a week an employee worked (E.g. 3 or 4 days a week.)
  # dedication_rate: the dedication rate of an employee in a team
  # project_weight: the weight of project of a specific team

  def calculate_capitalized_hour(work_days, capitalizable_rate, attendance_rate, dedication_rate, project_weight)
    return work_days * 7.6 * (capitalizable_rate/100.0) * (attendance_rate/100.0) * (dedication_rate/100.0) * (project_weight/100.0)
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

  # @param [Object] iteration
  def get_result_rows(iteration)
    @result = []
    @employees.each do |employee|
      dca = []
      for i in 0..4 do
        dca.append(Date_container.new(iteration.start_date + i.days))
      end
      employee.team_members.each do |team_member|
        team_member.team.projects.each do |project|
          if project.is_capitalizable
            result = calculate_capitalized_hour iteration.work_day, employee.capitalizable_group.capitalizable_rate, employee.attendance_type.attendance_rate, team_member.dedication_weight, project.weight
            #p employee.name
            (0..4).each { |i|
              intake = dca[i].fill(result.to_f)
              if intake.round(2) != 0

                result -= intake

                row = Cap_result_row.new(employee.name,
                                         project.team.name,
                                         project.name,
                                         dca[i].date,
                                         employee.employment_type,
                                         employee.hourly_rate,
                                         employee.location,
                                         employee.capitalizable_group.capitalizable_rate,
                                         team_member.dedication_weight,
                                         intake)
                #trans_workday_to_hours(7.6, intake).round(2))
                @result.append(row)
              end
            }
          end
          #p json
        end
      end
    end
    @result
  end


  def get_current_iteration
    Iteration.where("start_date < ? AND end_date > ?", Time.now, Time.now).take
  end

  def trans_workday_to_hours(hr_per_day, workday)
    (hr_per_day * workday).to_f
  end


  # noinspection RubyTooManyInstanceVariablesInspection
  class Cap_result_row
    attr_accessor :employee_name, :team, :project, :date, :employee_type, :hourly_rate, :location, :cap_weight, :dedication_weight, :cap_hour

    def initialize(name, t, p, d, type, rate, loc, cap_wt, dedi_wt, cap_hour)
      @employee_name = name
      @team = t
      @project = p
      @date = d
      @employee_type = type
      @hourly_rate = rate
      @location = loc
      @cap_weight = cap_wt
      @dedication_weight = dedi_wt
      @cap_hour = cap_hour
    end
  end

  class Date_container
    LIMIT = 7.6
    attr_accessor :date, :cap

    def initialize(date)
      @date = date
      @cap = 0
    end

    def is_full
      if :cap == LIMIT
        true
      else
        false
      end
    end

    def fill(part)
      if (@cap + part) >= LIMIT
        intake = LIMIT - @cap
        @cap = LIMIT
      else
        @cap += part
        intake = part
      end
      intake
    end
  end
end