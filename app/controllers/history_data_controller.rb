class HistoryDataController < ApplicationController
  before_action :set_history_datum, only: [:show, :edit, :update, :destroy]

  # GET /history_data
  # GET /history_data.json
  def index
    @history_data = HistoryDatum.all
  end

  # GET /history_data/1
  # GET /history_data/1.json
  def show
  end

  # GET /history_data/new
  def new
    @history_datum = HistoryDatum.new
  end

  # GET /history_data/1/edit
  def edit
  end

  # POST /history_data
  # POST /history_data.json
  def create
    @history_datum = HistoryDatum.new(history_datum_params)

    respond_to do |format|
      if @history_datum.save
        format.html { redirect_to @history_datum, notice: 'History datum was successfully created.' }
        format.json { render :show, status: :created, location: @history_datum }
      else
        format.html { render :new }
        format.json { render json: @history_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /history_data/1
  # PATCH/PUT /history_data/1.json
  def update
    respond_to do |format|
      if @history_datum.update(history_datum_params)
        format.html { redirect_to @history_datum, notice: 'History datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @history_datum }
      else
        format.html { render :edit }
        format.json { render json: @history_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_data/1
  # DELETE /history_data/1.json
  def destroy
    @history_datum.destroy
    respond_to do |format|
      format.html { redirect_to history_data_url, notice: 'History datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_datum
      @history_datum = HistoryDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_datum_params
      params.require(:history_datum).permit(:iteration_data, :result_data)
    end
end
