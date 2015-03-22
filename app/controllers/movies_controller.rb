class MoviesController < ApplicationController

  before_action :set_movie, only: [:show]

  before_action do
    if action_name == 'index'
      add_breadcrumb '動画一覧'
    else
      add_breadcrumb '動画一覧', movies_path
    end
  end

  def index
    @movies = Movie.page(params[:page]).all
  end

  def show
    add_breadcrumb @movie.title
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

end
