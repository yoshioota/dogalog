class Settings::WithdrawalsController < Settings::BaseController

  before_action :set_user, only: [:edit, :destroy]

  def edit
  end

  def destroy
    # 現状 ユーザー、動画、レビュー全て物理削除
    #
    # [TODO] ユーザに登録状態を追加する
    # ・動画は削除しない。
    # ・レビューは削除する。
    @user.destroy
    reset_session
    redirect_to '/'
  end

  private

  # current_userでform_forに突っ込むのか、引き直したほうがいいのかどうか、、
  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:display_name)
  end

end
