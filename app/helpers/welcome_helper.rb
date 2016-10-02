module WelcomeHelper
  def teammember_matrix
    matrix = []
    staff_teams_count = TeamMember.select('employee_id, count(id) AS teams_count').group('employee_id').order('teams_count DESC').to_a
    team_list = []
    Team.all.each { |t| team_list.append(t.name)}

    staff_teams_count.each do |e|
      p e.teams_count
    end

    row_container = Array.new(team_list.length)

    loop_counter = 0
    loop_limit = staff_teams_count.length

    begin
      loop_counter += 1
      staff = staff_teams_count.first
      staff_teams_count.delete_at(0)
      if staff.teams_count > 1
        records = TeamMember.where(:employee_id => staff.employee_id)
        matrix.append(allocate_full_row(team_list, records))
      else
        record = TeamMember.where(:employee_id => staff.employee_id).take

        if row_container[team_list.index(record.team.name)] == nil
          row_container[team_list.index(record.team.name)] = record.employee.name
        else
          staff_teams_count.push(staff)
        end
        if row_container.count(nil) == 0 || loop_counter == loop_limit
          matrix.append(row_container)
          row_container = Array.new(team_list.length)
          loop_counter = 0
          loop_limit = staff_teams_count.length
        end
      end

    end while staff_teams_count.length > 0

    { 'header' => team_list, 'matrix' => matrix}
    #Employee.select("songs.id, count(listens.id) AS listens_count").joins(:team_members).all
  end

  private
  def allocate_full_row(team_list, employee_team)
    row = Array.new(team_list.length)
      employee_team.each do |record|
        row[team_list.index(record.team.name)] = record.employee.name
      end
    row
  end

  def allocate_one_cell(team_list, employee_team)

  end
end
