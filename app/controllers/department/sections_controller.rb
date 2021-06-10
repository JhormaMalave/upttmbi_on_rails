class Department::SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]
  before_action :set_career

  # GET /department/sections or /department/sections.json
  def index
    @sections = Section.where(career_id: params[:career])
  end

  # GET /department/sections/1 or /department/sections/1.json
  def show
  end

  # GET /department/sections/new
  def new
    @section = Section.new
  end

  # GET /department/sections/1/edit
  def edit
  end

  # POST /department/sections or /department/sections.json
  def create
    @section = Section.new(section_params)
    @section.career_id = params[:career]

    respond_to do |format|
      if @section.save
        format.html { redirect_to department_section_path(id: @section.id), notice: "La sección fue creada exitosamente." }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /department/sections/1 or /department/sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to department_section_path(career: @career.id, id: @section.id), notice: "La sección fue actualizada correctamente." }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department/sections/1 or /department/sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to department_sections_url, notice: "La sección fue exitosamente creada." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    def set_career
      @career = Career.find(params[:career])
    end

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(:name, :trimester, :shift, :course_id, :period_id, :career_id)
    end
end
