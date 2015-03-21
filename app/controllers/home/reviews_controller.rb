class Home::ReviewsController < ApplicationController

  before_action :set_movie
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = current_user.reviews.includes(:movie).all
  end

  def show
  end

  def new
    @review = current_user.reviews.by_movie(@movie).first || Review.new
    if @review.new_record?
      @review.in_public = true
    else
      redirect_to action: :edit, movie_id: @movie.id, id: @review.id
    end
  end

  def edit
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to [:home, @movie, @review], notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to [:home, @movie, @review], notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to home_reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

  def set_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end

  def set_review
    @review = current_user.reviews.find_by(id: params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating, :in_public)
  end
end
