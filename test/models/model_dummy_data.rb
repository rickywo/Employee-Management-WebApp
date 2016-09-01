##
# Created By: Vinh Nguyen
# Contributors: Vinh Nguyen
#
class ModelDummyData
  attr_accessor :employee, :project_iteration2, :team,
                :project_iteration1, :iteration_attendance,
                :team_member, :team_member_list, :project_iteration_list,
                :project1, :iteration, :project2, :iteration_attendance_list

  def initialize
    # hardcoded dummy data
    # Employee data
    @employee = EmployeeModel.new("1","Harry Potter","Employee", "permanent", "1.0","Melbourne","01/01/2015","",0, "1")
    # Team data
    @team = TeamModel.new("1","Paid Acquisitor",0)
    # Two projects
    @project1 = ProjectModel.new("1", "Shopping Feed - Popular Products", 0, "", 0, "New Project Description 1")
    @project2 = ProjectModel.new("2", "Search Remarketing Emails", 0, "", 0, "New Project Description 2")
    # Iteration
    @iteration = IterationModel.new("1","22-Aug-2016","26-Aug-2016")
    # Employee's attendance in the iteration
    @iteration_attendance = IterationAttendanceModel.new("1",@iteration,@employee,100)
    # List of Employee's attendance in the iteration
    @iteration_attendance_list = IterationAttendanceList.new()
    @iteration_attendance_list.add_new_iteration_attendance(@iteration_attendance)
    # Assign each project to the iteration
    @project_iteration1 = ProjectIterationModel.new("1",@project1,@iteration)
    @project_iteration2 = ProjectIterationModel.new("2",@project2,@iteration)
    # project iteration list
    @project_iteration_list = ProjectIterationList.new()
    @project_iteration_list.add_new_project_iteration(@project_iteration1)
    @project_iteration_list.add_new_project_iteration(@project_iteration2)
    # Team member
    @team_member = TeamMemberModel.new("1",@team,@employee, 100)
    # Team member list
    @team_member_list = TeamMemberList.new()
    @team_member_list.add_new_team_member(@team_member);
  end


end