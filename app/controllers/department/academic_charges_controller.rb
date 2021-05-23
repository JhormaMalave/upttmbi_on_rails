class Department::AcademicChargesController < ApplicationController
  before_action :set_academic_charge, only: %i[ show edit update destroy ]

  # GET /department/academic_charges or /department/academic_charges.json
  def index
    @academic_charges = AcademicCharge.all
  end

  # GET /department/academic_charges/1 or /department/academic_charges/1.json
  def show
  end

  # GET /department/academic_charges/new
  def new
    @academic_charge = AcademicCharge.new
  end

  # GET /department/academic_charges/1/edit
  def edit
  end

  # POST /department/academic_charges or /department/academic_charges.json
  def create
    @academic_charge = AcademicCharge.new(academic_charge_params)

    respond_to do |format|
      if @academic_charge.save
        format.html { redirect_to department_academic_charge_path(@academic_charge), notice: "Academic charge was successfully created." }
        format.json { render :show, status: :created, location: @academic_charge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @academic_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /department/academic_charges/1 or /department/academic_charges/1.json
  def update
    respond_to do |format|
      if @academic_charge.update(academic_charge_params)
        format.html { redirect_to department_academic_charge_path(@academic_charge), notice: "Academic charge was successfully updated." }
        format.json { render :show, status: :ok, location: @academic_charge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @academic_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department/academic_charges/1 or /department/academic_charges/1.json
  def destroy
    @academic_charge.destroy
    respond_to do |format|
      format.html { redirect_to departmnet_academic_charges_url, notice: "Academic charge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_charge
      @academic_charge = AcademicCharge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def academic_charge_params
      params.require(:academic_charge).permit(:teacher_career_id, :section_id, :subject_id, :observation)
    end
end
