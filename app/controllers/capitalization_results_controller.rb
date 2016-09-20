class CapitalizationResultsController < ApplicationController
  before_action :set_capitalization_result, only: [:show, :edit, :update, :destroy]

  # GET /capitalization_results
  # GET /capitalization_results.json
  def index
    @capitalization_results = CapitalizationResult.all
  end

  # GET /capitalization_results/1
  # GET /capitalization_results/1.json
  def show
  end

  # GET /capitalization_results/new
  def new
    @capitalization_result = CapitalizationResult.new
  end

  # GET /capitalization_results/1/edit
  def edit
  end

  # POST /capitalization_results
  # POST /capitalization_results.json
  def create
    @capitalization_result = CapitalizationResult.new(capitalization_result_params)

    respond_to do |format|
      if @capitalization_result.save
        format.html { redirect_to @capitalization_result, notice: 'Capitalization result was successfully created.' }
        format.json { render :show, status: :created, location: @capitalization_result }
      else
        format.html { render :new }
        format.json { render json: @capitalization_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capitalization_results/1
  # PATCH/PUT /capitalization_results/1.json
  def update
    respond_to do |format|
      if @capitalization_result.update(capitalization_result_params)
        format.html { redirect_to @capitalization_result, notice: 'Capitalization result was successfully updated.' }
        format.json { render :show, status: :ok, location: @capitalization_result }
      else
        format.html { render :edit }
        format.json { render json: @capitalization_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capitalization_results/1
  # DELETE /capitalization_results/1.json
  def destroy
    @capitalization_result.destroy
    respond_to do |format|
      format.html { redirect_to capitalization_results_url, notice: 'Capitalization result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capitalization_result
      @capitalization_result = CapitalizationResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capitalization_result_params
      params.require(:capitalization_result).permit(:project_name, :employee_name, :date, :hours, :full_project_name, :hourly_rate)
    end
end
