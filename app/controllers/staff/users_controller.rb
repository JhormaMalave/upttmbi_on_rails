class Staff::UsersController < Staff::StaffController
  def index
    @users = User.all
  end
end
