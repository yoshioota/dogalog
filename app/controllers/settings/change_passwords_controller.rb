class Settings::ChangePasswordsController < Settings::BaseController

  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    # 現在のパスワードの確認までする場合は user#update_with_password を使用する
    # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-edit-their-password
    # ただuserモデルの場合はformのラベルが微妙なので、ラベルは 新しいパスワード、新しいパスワード(確認) に変えたほうがいいかも。
    if @user.update_with_password(user_params)
      redirect_to({action: :edit}, notice: 'Password was successfully updated.')
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
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end

end
