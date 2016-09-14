class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @columns = ['id', 'team_id', 'name', 'status', 'is_capitalizable', 'weight', 'release_date', 'description']
    @projects = Project.order('id ASC').paginate(
        :page => params[:page],
        :per_page => params[:rows])
    if request.xhr?
      render :json => json_for_jqgrid(@projects, @columns)
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    if :opr == 'edit'
      update
    else
      @project = Project.create({:name => params[:name],
                                 :team_id => params[:team_id],
                                 :status => params[:status],
                                 :is_capitalizable => params[:is_capitalizable],
                                 :weight => params[:weight],
                                 :release_date => params[:release_date],
                                 :description => params[:description]})

      if request.xhr?
        render :json => @project
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project = Project.find_by_id(params[:id])
    @project.update_attributes({:id => params[:id],
                                :name => params[:name],
                                :team_id => params[:team_id],
                                :status => params[:status],
                                :is_capitalizable => params[:is_capitalizable],
                                :weight => params[:weight],
                                :release_date => params[:release_date],
                                :description => params[:description]})
    if request.xhr?
      render :json => @project
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find_by_id(params[:id])
    @project.destroy

    if request.xhr?
      render :json => @project
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :status, :is_capitalizable, :weight, :release_date, :description, :team_id)
  end
end
