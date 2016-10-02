require 'project_csv_loader'
require 'employee_csv_loader'

class HomeController < ApplicationController
  include DataSerializer
  include HomeHelper
  include ModelFacade


  def show
    case params[:opr]
      when 'next_iteration'
        iteration_id = get_next_iteration(current_iteration).id
        p 'next'
      when 'previous_iteration'
        iteration_id = get_previous_iteration(current_iteration).id
        p 'previous'
      else
        iteration_id = params[:iteration_id]
    end
    if iteration_id != nil
    set_current_iteration(iteration_id)
    restore_iteration_data(current_iteration.id)
    end

  end

  def copy_iteration_data
    data = get_iteration_data_by_name(params[:from_id])
    #save_iteration_data(1)
    save_iteration_data_by_name(params[:to_id], data)
  end

  def load_project_csv
    file = params[:file].read
    #print1
    ProjectCSVLoader.new(file)
  end

  def load_employee_csv
    file = params[:file].read
    #print1
    EmployeeCsvLoader.new(file)
  end

  def save_data
    save_iteration_data(current_iteration.id)
  end
end
