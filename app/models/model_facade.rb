module ModelFacade
  # Begin of Team methods
  def get_team_by_name(name)
    Team.where(name: name).take
  end

  # End of Team methods

  # Begin of Employee methods
  def get_employee_by_name(name)
    Employee.where(name: name).take
  end

  # End of Employee methods


  # Begin of Project methods
  def get_project_by_name(name)
    Project.where(name: name).take
  end

  # End of Project methods

  # Begin of Capitalizable group methods
  def get_cap_group_by_rate(rate)
    CapitalizableGroup.where(capitalizable_rate: rate).take
  end

  def create_cap_group_by_rate(rate)
    description = '%.01f%'% rate
    CapitalizableGroup.create(capitalizable_rate: rate, description: description)
  end
  # End of Capitalizable group methods

  # Begin of Attendance type methods
  def get_attendance_by_rate(rate)
    AttendanceType.where(attendance_rate: rate).take
  end

  def create_attendance_by_rate(rate)
    name = '%d days'% (rate / 20)
    description = '%.01f%'% rate
    AttendanceType.create(name: name, attendance_rate: rate, description: description)
  end
  # End of Attendance type methods

  # Begin of TeamMemebr methods
  def get_teammber_by_name(team_name, employee_name)
    team = get_employee_by_name(employee_name)
    employee = get_team_by_name(team_name)
    TeamMember.where(team_id: team.id, employee_id: employee.id)
  end

  # End of TeamMemebr methods

  # Begin of Iteration methods
  def get_iteration_by_name(name)
    iteration = Iteration.where(name: name).take
    if iteration == nil
      iteration = create_iteration_by_name(name)
    end
    iteration
  end

  def get_next_iteration(this_iteration)
    date = Date.strptime(this_iteration.name, '%y-%W')
    next_monday = date.next_week
    next_iteration_name = next_monday.strftime('%y-%W')
    get_iteration_by_name(next_iteration_name)
  end

  def get_previous_iteration(this_iteration)
    date = Date.strptime(this_iteration.name, '%y-%W')
    last_monday = date.last_week
    previous_iteration_name = last_monday.strftime('%y-%W')
    get_iteration_by_name(previous_iteration_name)
  end

  def create_iteration_by_name(name)

    begin
      date = Date.strptime(name, '%y-%W')
      monday_of_week = Date.commercial(date.year, date.cweek)
      end_week_day = monday_of_week + 4
      iteration = Iteration.create(name: name, work_day: 5, start_date: monday_of_week, end_date: end_week_day)
    rescue
      raise 'Parsing Error: Iteration Name %s'%name
    end
    iteration
  end
  # End of Iteration methods


  def flush_db_for_load_team_proj
    ProjectIteration.delete_all
    Project.delete_all
    Team.delete_all
  end

  def get_num_proj_of_employee(name, capitalizable = true, weight_greater_than_zero = true)
    num_project = 0
    employee = get_employee_by_name(name)
    #Employee.select("songs.id, count(listens.id) AS listens_count").joins(:team_members).all
    records = TeamMember.select(:team_id).where(:employee_id => employee.id).includes(:team)
    records.each do |r|
      num_project += get_num_proj_of_team(r.team_id, capitalizable, weight_greater_than_zero)
    end
    p num_project
  end

  def get_num_proj_of_team(id, capitalizable, weight_greater_than_zero)
    num_project = 0
    case
      when capitalizable && weight_greater_than_zero
        num_project += Project.where(:team_id => id, :is_capitalizable => true).where('weight >?', 0).count
      when capitalizable && !weight_greater_than_zero
        num_project += Project.where(:team_id => id, :is_capitalizable => true).count
      when !capitalizable && weight_greater_than_zero
        num_project += Project.where(:team_id => id).where('weight >?', 0).count
      when !capitalizable && !weight_greater_than_zero
        num_project += Project.where(:team_id => id).count
    end
    p num_project
  end

  def contains_data(iteration_id)
    is_contains = false
    @history_datum = HistoryDatum.where(:iteration_id => iteration_id).take
    if @history_datum != nil
      is_contains = true
    end
    is_contains
  end

end