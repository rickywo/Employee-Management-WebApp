class CapitalizableGroupsController < ApplicationController
  before_action :set_capitalizable_group, only: [:show, :edit, :update, :destroy]

  # GET /capitalizable_groups
  # GET /capitalizable_groups.json
  def index
    @capitalizable_groups = CapitalizableGroup.all
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
    @capitalizable_group = CapitalizableGroup.new(capitalizable_group_params)

    respond_to do |format|
      if @capitalizable_group.save
        format.html { redirect_to @capitalizable_group, notice: 'Capitalizable group was successfully created.' }
        format.json { render :show, status: :created, location: @capitalizable_group }
      else
        format.html { render :new }
        format.json { render json: @capitalizable_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capitalizable_groups/1
  # PATCH/PUT /capitalizable_groups/1.json
  def update
    respond_to do |format|
      if @capitalizable_group.update(capitalizable_group_params)
        format.html { redirect_to @capitalizable_group, notice: 'Capitalizable group was successfully updated.' }
        format.json { render :show, status: :ok, location: @capitalizable_group }
      else
        format.html { render :edit }
        format.json { render json: @capitalizable_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capitalizable_groups/1
  # DELETE /capitalizable_groups/1.json
  def destroy
    @capitalizable_group.destroy
    respond_to do |format|
      format.html { redirect_to capitalizable_groups_url, notice: 'Capitalizable group was successfully destroyed.' }
      format.json { head :no_content }
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
