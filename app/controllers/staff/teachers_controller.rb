class Staff::TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show ]

  # GET /staff/teachers or /staff/teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /staff/teachers/new
  def new
    @teacher = Teacher.new
  end

  # POST /staff/teachers or /staff/teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to polymorphic_path([:staff, @teacher]), notice: "El docente se guardo correctamente." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:id_type_id, :id_number, :name, :surname, :birth_date, :obsevation, :hire_date, :ordinary_date, :status)
    end
end
