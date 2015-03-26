class AuthorizedController < ApplicationController

  before_action :authenticate_user!
  before_action :check_active_user

  private

  def check_active_user
    return true if current_user.user_status == UserStatus::ACTIVE

    reset_session
    '/'
  end
end
