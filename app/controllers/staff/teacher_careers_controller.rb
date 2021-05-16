class Staff::TeacherCareersController < Staff::StaffController
  before_action :set_teacher_career, only: %i[ show edit update destroy ]

  # GET /staff/teacher_careers or /staff/teacher_careers.json
  def index
    @careers = Career.all.order(:name)
  end

  # GET /staff/teacher_careers/1 or /staff/teacher_careers/1.json
  def show
  end

  # GET /staff/teacher_careers/new
  def new
    @teacher_career = TeacherCareer.new
  end

  # GET /staff/teacher_careers/1/edit
  def edit
  end

  # POST /staff/teacher_careers or /staff/teacher_careers.json
  def create
    @teacher_career = TeacherCareer.new(teacher_career_params)

    respond_to do |format|
      if @teacher_career.save
        format.html { redirect_to staff_teacher_career_path(@teacher_career), notice: "Teacher career was successfully created." }
        format.json { render :show, status: :created, location: @teacher_career }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher_career.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff/teacher_careers/1 or /staff/teacher_careers/1.json
  def update
    respond_to do |format|
      if @teacher_career.update(teacher_career_params)
        format.html { redirect_to staff_teacher_career_path(@teacher_career), notice: "Teacher career was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher_career }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher_career.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/teacher_careers/1 or /staff/teacher_careers/1.json
  def destroy
    @teacher_career.destroy
    respond_to do |format|
      format.html { redirect_to staff_teacher_careers_url, notice: "Teacher career was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_career
      @teacher_career = TeacherCareer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_career_params
      params.require(:teacher_career).permit(:teacher_id, :career_id, :observation, :status)
    end
end
