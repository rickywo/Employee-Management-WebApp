class CapHourCalculationController < ApplicationController
  def index
    @employees = Employee.all
    @iteration = Iteration.all
  end


end
