class Desk::UsersController < Desk::BaseController

  before_action :set_user, only: [:show, :update]

  def index
    @users = User.page(params[:page]).order('id DESC').all
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to({action: :show}, notice: 'User was successfully updated.')
    else
      render :show
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_status)
  end
end
