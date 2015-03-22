class ReviewsController < ApplicationController

  before_action :set_review, only: [:show]

  def index
    @reviews = Review.in_public.includes(:user, :movie).all
  end

  def show
    add_breadcrumb '動画一覧', movies_path
    add_breadcrumb @review.movie.title, movie_path(@review.movie)
    add_breadcrumb "#{@review.user.display_name}さんのレビュー"
    add_breadcrumb @review.title
  end

  private

  def set_review
    @review = Review.in_public.find(params[:id])
  end
end
