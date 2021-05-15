class Staff::HomeController < Staff::StaffController
  before_action :authenticate_user!
  

  def index
  end
end
