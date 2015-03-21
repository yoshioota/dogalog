class Home::MoviesController < ApplicationController

  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = current_user.movies.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to [:home, @movie], notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to [:home, @movie], notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to home_movies_url, notice: 'Movie was successfully destroyed.'
  end

  private

  def set_movie
    @movie = current_user.movies.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :url, :user_id)
  end

end
