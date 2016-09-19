class HomeController < ApplicationController
  def show
    set_current_iteration(Iteration.where('start_date < ? AND end_date > ?', Time.now, Time.now).take)
    if params[:iteration_id] != nil
      set_current_iteration(Iteration.find(params[:iteration_id]))
    end
  end
end
