class Desk::DeskUsersController < Desk::BaseController

  def index
    @desk_users = DeskUser.page(params[:page]).order('id DESC').all
  end

  def show
    @desk_user = DeskUser.find(params[:id])
  end

end
