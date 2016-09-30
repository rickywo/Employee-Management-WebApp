module DataSerializer
  require 'json'

  def save_iteration_data(iteration_id)

    @container = IterationDataContainer.new(
        encode_obj_arr_2_jstring_arr(TeamMember.all),
        encode_obj_arr_2_jstring_arr(IterationAttendance.all),
        encode_obj_arr_2_jstring_arr(Employee.all),
        encode_obj_arr_2_jstring_arr(CapitalizableGroup.all),
        encode_obj_arr_2_jstring_arr(AttendanceType.all),
        encode_obj_arr_2_jstring_arr(ProjectIteration.all),
        encode_obj_arr_2_jstring_arr(Project.all),
        encode_obj_arr_2_jstring_arr(Team.all)
    )

    @history_datum = HistoryDatum.where(:iteration_id => iteration_id).take
    if @history_datum == nil
      @history_datum = HistoryDatum.create(iteration_id: iteration_id, iteration_data: @container.to_json)
    else
      @history_datum = HistoryDatum.update(iteration_id: iteration_id, iteration_data: @container.to_json)
    end

  end

  def save_iteration_data_by_id(iteration_id, data)
    history_datum = HistoryDatum.where(:iteration_id => iteration_id).take
    if history_datum == nil
      HistoryDatum.create(iteration_id: iteration_id, iteration_data: data)
    else
      HistoryDatum.update(iteration_id: iteration_id, iteration_data: data)
    end
  end

  def save_iteration_data_by_name(iteration_name, data)
    iteration = Iteration.where(:name => iteration_name).take
    iteration_id = iteration.id
    save_iteration_data_by_id(iteration_id, data)
  end


  def get_iteration_data_by_id(iteration_id)
    history_datum = HistoryDatum.where(:iteration_id => iteration_id).take
    history_datum.iteration_data unless history_datum == nil
  end

  def get_iteration_data_by_name(iteration_name)
    iteration = Iteration.where(:name => iteration_name).take
    iteration_id = iteration.id
    get_iteration_data_by_id(iteration_id)
  end

  def save_result_data(iteration_id)

  end

  def restore_iteration_data(iteration_id)
    clean_db
    @history_datum = HistoryDatum.where(:iteration_id => iteration_id).take
    if @history_datum != nil
      json_c = HistoryDatum.first.iteration_data
      @container = JSON.parse(json_c)
      teams = @container["data"]["teams"]
      projects = @container["data"]["projects"]
      project_iterations = @container["data"]["project_iterations"]
      attendance_types = @container["data"]["attendance_types"]
      capitalizable_groups = @container["data"]["capitalizable_groups"]
      employees = @container["data"]["employees"]
      iteration_attendances = @container["data"]["iteration_attendances"]
      team_members = @container["data"]["team_members"]
      teams.each do |team|
        t = Team.new
        t.from_json(team)
        t.save
      end
      projects.each do |project|
        t = Project.new
        t.from_json(project)
        t.save
      end
      project_iterations.each do |pi|
        t = ProjectIteration.new
        t.from_json(pi)
        t.save
      end
      attendance_types.each do |at|
        t = AttendanceType.new
        t.from_json(at)
        t.save
      end
      capitalizable_groups.each do |cg|
        t = CapitalizableGroup.new
        t.from_json(cg)
        t.save
      end
      employees.each do |e|
        t = Employee.new
        t.from_json(e)
        t.save
      end
      iteration_attendances.each do |ia|
        t = IterationAttendance.new
        t.from_json(ia)
        t.save
      end
      team_members.each do |tm|
        t = TeamMember.new
        t.from_json(tm)
        t.save
      end
    end
  end

  def get_result_by_iteration_id(iteration_id)

  end

  private
  def encode_obj_arr_2_jstring_arr(array)
    json_a = []
    array.each { |x| json_a.append(x.to_json) }
    json_a
  end

  def clean_db
    TeamMember.delete_all
    IterationAttendance.delete_all
    Employee.delete_all
    CapitalizableGroup.delete_all
    AttendanceType.delete_all
    ProjectIteration.delete_all
    Project.delete_all
    Team.delete_all
  end

  private
  class IterationDataContainer
    def initialize(members, attendances, employees, groups, types, p_iterations, projects, teams)
      @team_members = members
      @iteration_attendances = attendances
      @employees = employees
      @capitalizable_groups = groups
      @attendance_types = types
      @project_iterations = p_iterations
      @projects = projects
      @teams = teams
    end

    def to_json(*a)
      {
          "json_class" => self.class.name,
          "data" => {"team_members" => @team_members,
                     "iteration_attendances" => @iteration_attendances,
                     "employees" => @employees,
                     "capitalizable_groups" => @capitalizable_groups,
                     "attendance_types" => @attendance_types,
                     "project_iterations" => @project_iterations,
                     "projects" => @projects,
                     "teams" => @teams}
      }.to_json(*a)
    end

    def self.json_create(o)
      new(o["data"]["team_members"],
          o["data"]["iteration_attendances"],
          o["data"]["employees"],
          o["data"]["capitalizable_groups"],
          o["data"]["attendance_types"],
          o["data"]["project_iterations"],
          o["data"]["projects"],
          o["data"]["teams"])
    end
  end
end