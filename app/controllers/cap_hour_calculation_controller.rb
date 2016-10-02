class CapHourCalculationController < ApplicationController
  include CsvExporter
  include CapitalizationCalculator
  include HistoryDataHelper

  def index
    @results = get_result_rows(current_iteration)
    respond_to do |format|
      format.html
      format.json
      format.csv {send_data result_to_csv(nil, @results, nil, nil, nil, nil), filename: "Timesheet output.csv"}
    end
  end

  def save_iteration
    restore_iteration_data(params[:iteration_id])
  end


end
