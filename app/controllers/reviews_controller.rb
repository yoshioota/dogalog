class ReviewsController < ApplicationController

  before_action :set_review, only: [:show]

  def index
    @reviews = Review.in_public.all
  end

  def show
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end
end
