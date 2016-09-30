module ModelFacade
  # Begin of Team methods
  def get_team_by_name(name)
    Team.where(name: name).take
  end

  # End of Team methods

  # Begin of Project methods
  def get_project_by_name(name)
    Project.where(name: name).take
  end

  # End of Project methods

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

end