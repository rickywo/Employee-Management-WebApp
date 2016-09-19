class CapitalizableGroupsController < ApplicationController
  before_action :set_capitalizable_group, only: [:show, :edit, :update, :destroy]

  # GET /capitalizable_groups
  # GET /capitalizable_groups.json
  def index
    if params[:iteration_id] != nil
      set_current_iteration(Iteration.find(params[:iteration_id]))
    end

    @columns = ['id', 'capitalizable_rate', 'description']
    @capitalizable_groups = CapitalizableGroup.order('id ASC').paginate(
        :page => params[:page],
        :per_page => params[:rows])
    if request.xhr?
      render :json => json_for_jqgrid(@capitalizable_groups, @columns)
    end
  end

  # GET /capitalizable_groups/1
  # GET /capitalizable_groups/1.json
  def show
  end

  # GET /capitalizable_groups/new
  def new
    @capitalizable_group = CapitalizableGroup.new
  end

  # GET /capitalizable_groups/1/edit
  def edit
  end

  # POST /capitalizable_groups
  # POST /capitalizable_groups.json
  def create
    if :opr == 'edit'
      update
    else
      @capitalizable_group = CapitalizableGroup.create({:capitalizable_rate => params[:capitalizable_rate], :description => params[:description]})

      if request.xhr?
        render :json => @capitalizable_group
      end
    end
  end

  # PATCH/PUT /capitalizable_groups/1
  # PATCH/PUT /capitalizable_groups/1.json
  def update
    @capitalizable_group = CapitalizableGroup.find_by_id(params[:id])
    @capitalizable_group.update_attributes({:capitalizable_rate => params[:capitalizable_rate], :description => params[:description]})

    if request.xhr?
      render :json => @capitalizable_group
    end
  end

  # DELETE /capitalizable_groups/1
  # DELETE /capitalizable_groups/1.json
  def destroy
    @capitalizable_group = CapitalizableGroup.find_by_id(params[:id])
    @capitalizable_group.destroy

    if request.xhr?
      render :json => @capitalizable_group
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_capitalizable_group
    @capitalizable_group = CapitalizableGroup.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def capitalizable_group_params
    params.require(:capitalizable_group).permit(:capitalizable_rate, :description)
  end
end
