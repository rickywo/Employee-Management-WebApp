class TeamMembersController < ApplicationController
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  # GET /team_members
  # GET /team_members.json
  def index
    if params[:iteration_id] != nil
      set_current_iteration(Iteration.find(params[:iteration_id]))
    end
    @columns = ['id', 'team_id', 'employee_id', 'dedication_weight']
    @team_members = TeamMember.order('id ASC').paginate(
        :page => params[:page],
        :per_page => params[:rows])
    if request.xhr?
      render :json => json_for_jqgrid(@team_members, @columns)
    end
    # @teams = Team.order('id ASC').paginate(
    #     :page     => params[:page],
    #     :per_page => params[:rows])
  end

  # GET /team_members/1
  # GET /team_members/1.json
  def show
  end

  # GET /team_members/new
  def new
    @team_member = TeamMember.new
  end

  # GET /team_members/1/edit
  def edit
  end

  # POST /team_members
  # POST /team_members.json
  def create
    if :opr == 'edit'
      update
    else
      @team_member = TeamMember.create({:team_id => params[:team_id],
                                        :employee_id => params[:employee_id],
                                        :dedication_weight => params[:dedication_weight]})

      if request.xhr?
        render :json => @team_member
      end
    end
  end

  # PATCH/PUT /team_members/1
  # PATCH/PUT /team_members/1.json
  def update
    @team_member = TeamMember.find_by_id(params[:id])
    @team_member.update_attributes({:team_id => params[:team_id],
                                    :employee_id => params[:employee_id],
                                    :dedication_weight => params[:dedication_weight]})

    if request.xhr?
      render :json => @team_member
    end
  end

  # DELETE /team_members/1
  # DELETE /team_members/1.json
  def destroy
    @team_member = TeamMember.find_by_id(params[:id])
    @team_member.destroy

    if request.xhr?
      render :json => @team_member
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team_member
    @team_member = TeamMember.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_member_params
    params.require(:team_member).permit(:team_id, :employee_id, :dedication_weight)
  end
end
