class Desk::MoviesController < Desk::BaseController

  def index
    @movies = Movie.page(params[:page]).order('id DESC').includes(:user).all
  end

  def show
    @movie = Movie.includes(:reviews => :user).find(params[:id])
  end
end
