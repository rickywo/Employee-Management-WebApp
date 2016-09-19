class IterationsController < ApplicationController
  before_action :set_iteration, only: [:show, :edit, :update, :destroy]

  # GET /iterations
  # GET /iterations.json
  def index
    if params[:iteration_id] != nil
      set_current_iteration(Iteration.find(params[:iteration_id]))
    end
    @columns = ['id', 'start_date', 'end_date', 'work_day']
    @iterations = Iteration.order('id ASC').paginate(
        :page => params[:page],
        :per_page => params[:rows])
    if request.xhr?
      render :json => json_for_jqgrid(@iterations, @columns)
    end
    # @teams = Team.order('id ASC').paginate(
    #     :page     => params[:page],
    #     :per_page => params[:rows])
  end

  # GET /iterations/1
  # GET /iterations/1.json
  def show
  end

  # GET /iterations/new
  def new
    @iteration = Iteration.new
  end

  # GET /iterations/1/edit
  def edit
  end

  # POST /iterations
  # POST /iterations.json
  def create
    @iteration = Iteration.create({:start_date => params[:start_date],
                                   :end_date => params[:end_date],
                                   :work_day => params[:work_day]})

    if request.xhr?
      render :json => @iteration
    end
  end

  # PATCH/PUT /iterations/1
  # PATCH/PUT /iterations/1.json
  def update
    if :opr == 'edit'
      update
    else
      @iteration = Iteration.find_by_id(params[:id])
      @iteration.update_attributes({:start_date => params[:start_date],
                                    :end_date => params[:end_date],
                                    :work_day => params[:work_day]})

      if request.xhr?
        render :json => @iteration
      end
    end

  end

  # DELETE /iterations/1
  # DELETE /iterations/1.json
  def destroy
    @iteration = Iteration.find_by_id(params[:id])
    @iteration.destroy

    if request.xhr?
      render :json => @iteration
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_iteration
    @iteration = Iteration.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def iteration_params
    params.require(:iteration).permit(:start_date, :end_date, :work_day)
  end
end
