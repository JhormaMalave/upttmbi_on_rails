class Staff::StaffController < ApplicationController
  before_action :authenticate_user!
  layout 'staff'
  
end