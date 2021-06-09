class Department::HomeController < ApplicationController
  def index
    @teacher_count = TeacherCareer.where(career: params[:career]).all.count
    @teacher_active_count = TeacherCareer.where(career: params[:career], status: true).count
    @teachers = TeacherCareer.where(career: params[:career]).last(5)
    @periods_count = Period.all.count
    @periods_active_count = Period.where(status: true).count
    @periods = Period.where(status: true).last(5)
    @career = Career.find(params[:career])
    @section_count = Section.where(career: params[:career]).count
    @section_active_count = Section.where(career: params[:career], period: Period.where(status: true)).count
    @subject_count = Subject.where(career: params[:career]).count
    @subject_active_count = Subject.where(career: params[:career], status: true).count
  end
end
