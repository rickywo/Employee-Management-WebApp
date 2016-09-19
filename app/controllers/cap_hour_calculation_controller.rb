class CapHourCalculationController < ApplicationController
  include CapHourCalculationHelper
  def index
    if params[:iteration_id] != nil
      set_current_iteration(Iteration.find(params[:iteration_id]))
    end
    @employees = Employee.order('id ASC').all
    @iterations = Iteration.all
    set_current_iteration(Iteration.find(params[:iteration_id]))
    columns = ['project', 'employee_name', 'date', 'cap_hour', 'employee_type', 'project', 'hourly_rate']
    header = ['Project Name', 'Employee', 'Date', 'Hours', 'Full Project Name', 'Project Rate']
    respond_to do |format|
      format.html
      format.json
      format.csv {send_data result_to_csv(columns, header), filename: "Timesheet output.csv"}
    end
  end


end
