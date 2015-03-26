class Desk::ReviewsController < Desk::BaseController

  def index
    @reviews = Review.page(params[:page]).includes(:user).order('id DESC').all
  end

  def show
    @review = Review.find(params[:id])
  end
end
