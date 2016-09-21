class HomeController < ApplicationController
  include HistoryDataHelper

  def show
    if params[:iteration_id] != nil
      set_current_iteration(params[:iteration_id])
      restore_iteration_data(current_iteration.id)
      p "reset iteration"
    end
  end

  def copy_iteration_data
   data = get_iteration_data_by_id(params[:from_id].to_i)
    #save_iteration_data(1)
    save_iteration_by_id(params[:to_id].to_i, data)
  end

  def save_data
    save_iteration_data(current_iteration.id)
  end
end
