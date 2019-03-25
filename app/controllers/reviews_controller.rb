class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    @review.save
    redirect_to book_path(@book)
  end

  def index
    @user = params[:arg]
    if params[:sort] == "newest"
      @reviews = Review.where(username: @user).newest
    elsif
      params[:sort] == "oldest"
      @reviews = Review.where(username: @user).oldest
    else
        @reviews = Review.where(username: @user)
    end
  end

private
  def review_params
    params.require(:review).permit(:heading, :score, :full_review, :username)
  end
end
