class Staff::HomeController < Staff::StaffController
  before_action :authenticate_user!
  

  def index
    @teacher_count = Teacher.all.count
    @teacher_active_count = Teacher.where(status: true).count
    @teacher = Teacher.last(5)
    @user_count = User.all.count
    @user_admin_count = User.all.count
    @career_count = Career.all.count
    @career_active_count = Career.all.count
    @subject_count = Subject.all.count
    @subject_active_count = Subject.all.count
  end
end
