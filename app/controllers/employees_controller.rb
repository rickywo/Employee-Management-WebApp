class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    #@teams = Team.order('id ASC').all
    @columns = ['id', 'name', 'title', 'status', 'employment_type', 'attendance_type_id', 'hourly_rate', 'location', 'capitalizable_group_id','commencement_date', 'termination_date']
    #@employees = Employee.all
    @employees = Employee.order('id ASC').paginate(
        :page     => params[:page],
        :per_page => params[:rows])
    if request.xhr?
      render :json => json_for_jqgrid(@employees, @columns)
    end
    # @teams = Team.order('id ASC').paginate(
    #     :page     => params[:page],
    #     :per_page => params[:rows])
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    if :opr == 'edit'
      update
    else
      @employee = Employee.create({:name => params[:name],
                                   :title => params[:title],
                                   :status => params[:status],
                                   :employment_type => params[:employment_type],
                                   :attendance_type_id => params[:attendance_type_id],
                                   :hourly_rate => params[:hourly_rate],
                                   :location => params[:location],
                                   :capitalizable_group_id => params[:capitalizable_group_id],
                                   :commencement_date => params[:commencement_date],
                                   :termination_date => params[:termination_date]})
      if request.xhr?
        render :json => @employee
      end
    end


  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    @employee = Employee.find_by_id(params[:id])
    @employee.update_attributes({:id => params[:id],
                                 :name => params[:name],
                                 :title => params[:title],
                                 :status => params[:status],
                                 :employment_type => params[:employment_type],
                                 :attendance_type_id => params[:attendance_type_id],
                                 :hourly_rate => params[:hourly_rate],
                                 :location => params[:location],
                                 :capitalizable_group_id => params[:capitalizable_group_id],
                                 :commencement_date => params[:commencement_date],
                                 :termination_date => params[:termination_date]})
    if request.xhr?
      render :json => @employee
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find_by_id(params[:id])
    @employee.destroy

    if request.xhr?
      render :json => @employee
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :title, :status, :employment_type, :attendance_type_id, :hourly_rate, :location, :capitalizable_group_id, :commencement_date, :termination_date)
    end
end
