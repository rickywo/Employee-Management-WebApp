require 'csv'
include ModelFacade

class EmployeeCsvLoader

  # Intiative	Name	                % Cap	EMP	Days
  # SHOP	    Amelia C Crook	      12.5	P	  80%
  #           Russell Greenwood	    75	  P	  100%
  #           Erica L Smith	        25	  P	  100%
  #           Sebastian Glazebrook	100	  P	  100%

  # Index of columns
  INITIATIVE_NAME_IND = 0
  EMPLOYEE_NAME_IND = 1
  CAP_FACTOR_IND = 2
  EMP_TYPE_IND = 3
  WORK_DAY_IND = 4

  def initialize(file_in)

    # initialize all containers
    @teams = []
    @employees = []
    @team_members = []
    team_name = nil

    TeamMember.delete_all
    # flush_db_for_load_team_proj
    # loop through each record in the csv file, adding
    # each record to our array.
    CSV.parse(file_in, col_sep: ',', row_sep: :auto) do |row|

      # Re-assign team name when team name is not empty
      team_name = row[INITIATIVE_NAME_IND] unless row[INITIATIVE_NAME_IND] == nil

      employee_name = row[EMPLOYEE_NAME_IND]





      if employee_name != nil
        # remove the header row of a table
        next if employee_name.include? 'Name'


        p '%s, %s' % [team_name, employee_name]

        # process cap group string

        capitalizable_group = parse_str_to_cap_group(row[CAP_FACTOR_IND])
        # construct project model
        # process employment type string
        employment_type = parse_str_to_emp_type(row[EMP_TYPE_IND])

        # process work type string
        work_type = parse_str_to_work_type(row[WORK_DAY_IND])

        load_employee_to_db(employee_name, employment_type, capitalizable_group.id, work_type.id)
        load_team_member_to_db(team_name, employee_name)
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
  def load_employee_to_db(name, status=true, emp_type, cap_group, att_type)
    employee = get_employee_by_name(name)
    if employee == nil
      Employee.create(:name => name,
                      :status => status,
                      :employment_type => emp_type,
                      :capitalizable_group_id => cap_group,
                      :attendance_type_id => att_type)
    else
      employee.update(:name => name,
                      :status => status,
                      :employment_type => emp_type,
                      :capitalizable_group_id => cap_group,
                      :attendance_type_id => att_type)
    end
  end

  def load_team_member_to_db(team_name, employee_name)
    # should clean team_member relation before loading in

    team = get_team_by_name(team_name)
    employee = get_employee_by_name(employee_name)
    if team != nil && employee != nil
      TeamMember.create(:team_id => team.id, :employee_id => employee.id)

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

  def parse_str_to_cap_group(str)
    cap_rate = str.to_f
    cap_group = get_cap_group_by_rate(cap_rate)
    if cap_group == nil
      cap_group = create_cap_group_by_rate(cap_rate)
    end
    cap_group

  end

  def parse_str_to_emp_type(str)
    employment_type = 1
    case str
      when 'P'
      when 'p'
        employment_type = 1
      when 'C'
      when 'c'
        employment_type = 2
    end
    employment_type
  end

  def parse_str_to_work_type(str)
    att_rate = str.to_f
    att_type = get_attendance_by_rate(att_rate)
    if att_type == nil
      att_type = create_attendance_by_rate(att_rate)
    end
    att_type
  end

end