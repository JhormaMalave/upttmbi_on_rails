class Staff::SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]

  # GET /staff/subjects or /staff/subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /staff/subjects/1 or /staff/subjects/1.json
  def show
  end

  # GET /staff/subjects/new
  def new
    @subject = Subject.new
  end

  # GET /staff/subjects/1/edit
  def edit
  end

  # POST /staff/subjects or /staff/subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to staff_subject_path(@subject), notice: "La asignatura fue creada exitosamente." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff/subjects/1 or /staff/subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to staff_subject_path(@subject), notice: "La asignatura fue actualizada exitosamente." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/subjects/1 or /staff/subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to staff_subjects_url, notice: "La asignatura fue elimindada exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:name, :curricular_units, :duration, :subject_type, :status, :course_id, :career_id)
    end
end
