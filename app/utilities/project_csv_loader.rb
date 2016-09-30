require 'csv'
include ModelFacade

class ProjectCSVLoader
  # Index of columns
  ITERATION_LABEL_IND = 1
  ITERATION_NUM_IND = 2


  PROJECT_NAME_IND = 1
  ITER_S_DATE_IND = 3
  ITER_E_DATE_IND = 4
  RELEASE_DATE_IND = 5
  STATUS_IND = 6
  COMPLETED_IND = 7
  TEAM_NAME_IND = 8
  CAPT_IND = 9
  PROJ_WEIGHT_IND = 10
  DESC_IND = 11
  def initialize(file_in)

    # initialize all containers
    @teams = []
    @projects = []
    @team_projects = []
    @project_iterations = []
    iteration = nil

    # flush_db_for_load_team_proj
    # loop through each record in the csv file, adding
    # each record to our array.
    CSV.parse(file_in, col_sep: ',', row_sep: :auto) do |row|

      # Get iteration number in format e.g. '16-35'
      if row[ITERATION_LABEL_IND] == 'Iteration'
        iteration = get_iteration_by_name(row[ITERATION_NUM_IND])
      end



      team_name = row[TEAM_NAME_IND]
      proj_name = row[PROJECT_NAME_IND]
      description = row[DESC_IND]

      # process Y/N string
      capitalizable = parse_str_cap(row[CAPT_IND])

      # process weight string
      weight = parse_str_wt(row[PROJ_WEIGHT_IND])

      # process date string
      date = parse_str_date(row[RELEASE_DATE_IND])

      # process completed column string
      is_completed = parse_str_comp(row[COMPLETED_IND])

      # process status column string
      status = parse_str_status(row[STATUS_IND])

      # process Start Iteration column string
      start_iter = parse_str_iter(row[ITER_S_DATE_IND])

      # process End Iteration column string
      end_iter = parse_str_iter(row[ITER_E_DATE_IND])

      if row[PROJECT_NAME_IND] != nil && row[TEAM_NAME_IND] != nil
        # remove the header row of a table
        next if row[TEAM_NAME_IND].include? 'Team'


        load_team_to_db(team_name)


        # construct project model
        load_project_to_db(team_name, proj_name, date, weight, capitalizable, description)

      end
    end
  end

  # return and array of project_model
  def projects
    @projects
  end

  # return an array of team_model
  def teams
    @teams
  end

  private
  def load_team_to_db(name, status=true)
    team = get_team_by_name(name)
    if team == nil
      Team.create(:name => name)
    else
      team.update(:status => status)
    end
  end

  def load_project_to_db(team_name, name, status=1, release_date, weight, capitalizable, description)
    team = get_team_by_name(team_name)
    project = get_project_by_name(name)
    if project == nil
      Project.create(:team_id => team.id,
                     :name => name,
                     :status => status,
                     :release_date => release_date,
                     :weight => weight,
                     :is_capitalizable => capitalizable,
                     :description => description)
    else
      project.update(:team_id => team.id,
                     :name => name,
                     :status => status,
                     :release_date => release_date,
                     :weight => weight,
                     :is_capitalizable => capitalizable,
                     :description => description)
    end
  end


  def parse_str_date(str)
    date = nil
    if str != nil
      begin
        date = DateTime.strptime(str, '%d-%b-%Y')
      rescue
        # do nothing
        # date = nil
      end
    end
    date
  end

  def parse_str_cap(str)
    case str
      when 'Y'
        is_capitalizable = true
      else
        is_capitalizable = false
    end
    is_capitalizable
  end

  def parse_str_wt(str)
    weight = 0
    if str != nil
      begin
        weight = str.chomp('%').to_f
      rescue
        # do nothing
        # date = nil
      end
    end
    weight
  end

  def parse_str_iter(str)
    str
  end

  def parse_str_status(str)
    str
  end

  def parse_str_comp(str)
    str
  end

end