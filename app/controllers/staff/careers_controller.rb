class Staff::CareersController < ApplicationController
  before_action :set_career, only: %i[ show edit update destroy ]

  # GET /staff/careers or /staff/careers.json
  def index
    @careers = Career.all
  end

  # GET /staff/careers/1 or /staff/careers/1.json
  def show
  end

  # GET /staff/careers/new
  def new
    @career = Career.new
  end

  # GET /staff/careers/1/edit
  def edit
  end

  # POST /staff/careers or /staff/careers.json
  def create
    @career = Career.new(career_params)

    respond_to do |format|
      if @career.save
        format.html { redirect_to staff_career_path(@career), notice: "La carrera fue crearda exitosamente." }
        format.json { render :show, status: :created, location: @career }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff/careers/1 or /staff/careers/1.json
  def update
    respond_to do |format|
      if @career.update(career_params)
        format.html { redirect_to staff_career_path(@career), notice: "La carrerar fue actualizada exitosamente." }
        format.json { render :show, status: :ok, location: @career }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/careers/1 or /staff/careers/1.json
  def destroy
    @career.destroy
    respond_to do |format|
      format.html { redirect_to staff_careers_url, notice: "Carrera eliminada exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career
      @career = Career.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def career_params
      params.require(:career).permit(:name)
    end
end
