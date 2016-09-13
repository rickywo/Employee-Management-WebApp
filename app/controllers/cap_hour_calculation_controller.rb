class CapHourCalculationController < ApplicationController
  include CapHourCalculationHelper
  def index
    @employees = Employee.all
    @iterations = Iteration.all
    @this_iteration = get_current_iteration
    get_result_rows
    columns = ['project', 'employee_name', 'date', 'cap_hour', 'employee_type', 'project', 'hourly_rate']
    header = ['Project Name', 'Employee', 'Date', 'Hours', 'Full Project Name', 'Project Rate']
    respond_to do |format|
      format.html
      format.json
      format.csv {send_data result_to_csv(columns, header), filename: "Timesheet output.csv"}
    end
  end


end
