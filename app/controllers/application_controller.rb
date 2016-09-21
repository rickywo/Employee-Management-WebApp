class ApplicationController < ActionController::Base
  before_filter :current_iteration
  protect_from_forgery with: :exception
  helper_method :current_user, :current_iteration, :set_current_iteration
  WORK_ITERATION = "work_iteration"

  def current_iteration
    begin
      work_iteration = State.where(state: WORK_ITERATION).take
      Iteration.find(work_iteration.value)
    rescue ArgumentError
      # Invalid date
      raise ActiveRecord::RecordNotFound
    end
  rescue ActiveRecord::RecordNotFound
      State.create(state: WORK_ITERATION, value: Iteration.first.id)
      Iteration.first
  end

  def set_current_iteration(iteration_id)
    work_iteration = State.where(state: WORK_ITERATION).take
    work_iteration.update_attribute('value', iteration_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
