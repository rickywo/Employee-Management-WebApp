class ApplicationController < ActionController::Base
  before_filter :current_iteration
  protect_from_forgery with: :exception
  helper_method :current_user, :current_iteration, :set_current_iteration

  def current_iteration
    @current_iteration
  end

  def set_current_iteration(iteration)
    @current_iteration = iteration
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
