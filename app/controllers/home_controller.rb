class HomeController < ApplicationController
  def show

    if params[:iteration_id] != nil
      set_current_iteration(Iteration.find(params[:iteration_id]))
    else
      set_current_iteration(Iteration.where('start_date < ? AND end_date > ?', Time.now, Time.now).take)
    end
  end
end
