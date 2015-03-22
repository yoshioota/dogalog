class Home::MoviesController < Home::BaseController

  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  before_action do
    if action_name == 'index'
      add_breadcrumb 'あなたが登録した動画'
    else
      add_breadcrumb 'あなたが登録した動画', home_movies_path
    end
  end

  def index
    @movies = current_user.movies.all
  end

  def show
    add_breadcrumb @movie.title
  end

  def new
    add_breadcrumb '新規登録'
    @movie = Movie.new
  end

  def edit
    add_breadcrumb @movie.title, home_movie_path(@movie)
    add_breadcrumb '変更'
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
    params.require(:movie).permit(:title, :description, :url)
  end

end
