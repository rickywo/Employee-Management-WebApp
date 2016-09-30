class ApplicationController < ActionController::Base
  before_action :current_iteration
  protect_from_forgery with: :exception
  helper_method :current_user, :current_iteration, :set_current_iteration
  WORK_ITERATION = "work_iteration"

  def current_iteration
    work_iteration = State.where(state: WORK_ITERATION).take
    if work_iteration != nil
      if work_iteration.value == nil
        work_iteration.value = Iteration.first.id
      end
      Iteration.find(work_iteration.value)
    else
      if Iteration.count == 0
        iteration_name = Date.now.strftime('%y-%W')
        iteration = get_iteration_by_name(iteration_name)
      else
        iteration = Iteration.first
      end
      State.create(state: WORK_ITERATION, value: iteration.id)
      iteration
    end

  end

  def set_current_iteration(iteration_id)
    work_iteration = State.where(state: WORK_ITERATION).take
    work_iteration.update_attribute('value', iteration_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
