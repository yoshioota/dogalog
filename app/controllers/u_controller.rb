class UController < AuthorizedController

  def show
    @user = User.includes(:movies, :reviews).find(params[:id])
  end
end
