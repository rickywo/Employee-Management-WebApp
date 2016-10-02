include ModelFacade
include WelcomeHelper
class WelcomeController < ApplicationController
  def index
    @data = get_num_proj_of_employee('Georg Friedrich')

  end
end
