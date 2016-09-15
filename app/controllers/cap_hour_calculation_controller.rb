class CapHourCalculationController < ApplicationController
  include CapHourCalculationHelper
  def index
    @this_iteration = get_current_iteration
    if params[:iteration_id] != nil
      p 'iteration is not nil'
      @this_iteration = Iteration.find(params[:iteration_id])

    end
    p @this_iteration
    @employees = Employee.all
    @iterations = Iteration.all
    get_result_rows(@this_iteration)
    columns = ['project', 'employee_name', 'date', 'cap_hour', 'employee_type', 'project', 'hourly_rate']
    header = ['Project Name', 'Employee', 'Date', 'Hours', 'Full Project Name', 'Project Rate']
    respond_to do |format|
      format.html
      format.json
      format.csv {send_data result_to_csv(columns, header), filename: "Timesheet output.csv"}
    end
  end


end
