class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    #@teams = Team.order('id ASC').all
    @columns = ['id', 'name', 'status']
    @teams = Team.order('id ASC').paginate(
        :page => params[:page],
        :per_page => params[:rows])
    if request.xhr?
      render :json => json_for_jqgrid(@teams, @columns)
    end
    # @teams = Team.order('id ASC').paginate(
    #     :page     => params[:page],
    #     :per_page => params[:rows])
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.create({:name => params[:name], :status => params[:status]})

    if request.xhr?
      render :json => @team
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    if :opr == 'edit'
      update
    else
      @team = Team.find_by_id(params[:id])
      @team.update_attributes({:id => params[:id], :name => params[:name], :status => params[:status]})

      if request.xhr?
        render :json => @team
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find_by_id(params[:id])
    @team.destroy

    if request.xhr?
      render :json => @team
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.require(:team).permit(:name, :status)
  end
end
