class Staff::TeachersController < ApplicationController
  # GET /staff/teachers or /staff/teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /staff/teachers/new
  def new
    @teacher = Teacher.new
  end
end
