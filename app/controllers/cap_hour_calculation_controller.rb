class CapHourCalculationController < ApplicationController
  include CapitalizationCalculator
  include HistoryDataHelper

  def index
    @this_iteration = current_iteration
    if params[:iteration_id] != nil
      @this_iteration = Iteration.find(params[:iteration_id])

    end
    @employees = Employee.order('id ASC').all
    @iterations = Iteration.all
    @results = get_result_rows(@this_iteration)
    respond_to do |format|
      format.html
      format.json
      format.csv {send_data result_to_csv(nil, nil, nil, nil, nil), filename: "Timesheet output.csv"}
    end
  end

  def save_iteration
    restore_iteration_data(params[:iteration_id])
  end


end
