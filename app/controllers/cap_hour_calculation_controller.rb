class CapHourCalculationController < ApplicationController
  include CapHourCalculationHelper
  def index
    @employees = Employee.all
    @iterations = Iteration.all
    @this_iteration = get_current_iteration
  end


end
