class Staff::TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end
end
