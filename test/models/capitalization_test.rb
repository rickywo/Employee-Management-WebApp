##
# Created By: Vinh Nguyen
# Contributors: Vinh Nguyen
#
# The class contains unit test for CapitalizationResult object
require 'test_helper'

class CapitalizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  ##
  # Test calculation without leave
  def test_calculation_without_leave
    @dummy_data = ModelDummyData.new()
    # Team data
    @team = @dummy_data.team
    # Employee data
    @employee = @dummy_data.employee
    # Iteration data
    @iteration = @dummy_data.iteration
    # team member list data
    @team_member_list = @dummy_data.team_member_list
    # Project iteration list data
    @project_iteration_list = @dummy_data.project_iteration_list
    # iteration attendance list data
    @iteration_attendance_list = @dummy_data.iteration_attendance_list
    # capitalization result
    @capitalization_result = CapitalizationResultModel(@team.id, @employee.id, @iteration.id)
    @capitalization_result.calculation(@team_member_list,@project_iteration_list,@iteration_attendance_list)
  end
end
