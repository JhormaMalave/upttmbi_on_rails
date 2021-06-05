class Staff::UsersController < Staff::StaffController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /staff/users
  def index
    @users = User.all
  end

  # GET /staff/users/1
  def show
  end

  # GET /staff/users/new
  def new
    @user = User.new
    @careers = Career.all
  end

  # GET /staff/user/1/edit
  def edit
    @careers = Career.all
  end

  # POST /staff/users or /staff/users.json
  def create
    @user = User.new(user_params)
    @careers = Career.all

    respond_to do |format|
      if @user.save
        format.html { redirect_to staff_user_path(@user), notice: "El usuario fue registrado exitosamente." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff/users/1 or /staff/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to polymorphic_path([:staff, @user]), notice: "El usuario se actualizo correctamente." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/users/1 or /staff/users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to staff_users_url, notice: "El usuario fue eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, career_list: [])
    end
end
