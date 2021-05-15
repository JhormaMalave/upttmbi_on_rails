class Staff::TeacherDegreesController < Staff::StaffController
  before_action :set_teacher_degree, only: %i[ show edit update destroy ]

  # GET /staff/teacher_degrees or /staff/teacher_degrees.json
  def index
    @teacher_degrees = TeacherDegree.all
  end

  # GET /staff/teacher_degrees/1 or /staff/teacher_degrees/1.json
  def show
  end

  # GET /staff/teacher_degrees/new
  def new
    @teacher_degree = TeacherDegree.new
  end

  # GET /staff/teacher_degrees/1/edit
  def edit
  end

  # POST /staff/teacher_degrees or /staff/teacher_degrees.json
  def create
    @teacher_degree = TeacherDegree.new(teacher_degree_params)

    respond_to do |format|
      if @teacher_degree.save
        format.html { redirect_to staff_teacher_degree_path(@teacher_degree), notice: "Teacher degree was successfully created." }
        format.json { render :show, status: :created, location: @teacher_degree }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher_degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff/teacher_degrees/1 or /staff/teacher_degrees/1.json
  def update
    respond_to do |format|
      if @teacher_degree.update(teacher_degree_params)
        format.html { redirect_to staff_teacher_degree_path(@teacher_degree), notice: "Teacher degree was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher_degree }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher_degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/teacher_degrees/1 or /staff/teacher_degrees/1.json
  def destroy
    @teacher_degree.destroy
    respond_to do |format|
      format.html { redirect_to staff_teacher_degrees_url, notice: "Teacher degree was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_degree
      @teacher_degree = TeacherDegree.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_degree_params
      params.require(:teacher_degree).permit(:name, :degree_type, :status, :teacher_id)
    end
end
