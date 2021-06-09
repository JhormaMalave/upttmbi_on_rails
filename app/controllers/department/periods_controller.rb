class Department::PeriodsController < ApplicationController
  before_action :set_period, only: %i[ show edit update destroy ]
  before_action :set_career, only: %i[ index show edit new]

  # GET /department/periods or /department/periods.json
  def index
    @periods = Period.all
    
  end

  # GET /department/periods/1 or /department/periods/1.json
  def show
  end

  # GET /department/periods/new
  def new
    @period = Period.new
  end

  # GET /department/periods/1/edit
  def edit
  end

  # POST /department/periods or /department/periods.json
  def create
    @period = Period.new(period_params)

    respond_to do |format|
      if @period.save
        format.html { redirect_to department_period_path(id: @period.id), notice: "El periodo fue exitosamente creado." }
        format.json { render :show, status: :created, location: @period }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /department/periods/1 or /department/periods/1.json
  def update
    respond_to do |format|
      if @period.update(period_params)
        format.html { redirect_to department_period_path(id: @period.id), notice: "Period was successfully updated." }
        format.json { render :show, status: :ok, location: @period }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department/periods/1 or /department/periods/1.json
  def destroy
    @period.destroy
    respond_to do |format|
      format.html { redirect_to department_periods_url, notice: "Period was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_period
      @period = Period.find(params[:id])
    end

    def set_career
      @career = Career.find(params[:career])
    end

    # Only allow a list of trusted parameters through.
    def period_params
      params.require(:period).permit(:name, :start, :finish, :status)
    end
end
