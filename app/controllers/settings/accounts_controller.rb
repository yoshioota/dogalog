class  Settings::AccountsController < Settings::BaseController

  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    # [FIXME] emailを変えた時の文言が全く優しくない。
    if @user.update(user_params)
      redirect_to({action: :edit}, notice: 'User was successfully updated.')
    else
      render :edit
    end
  end

  private

  # current_userでform_forに突っ込むのか、引き直したほうがいいのかどうか、、
  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:display_name, :email)
  end

end
