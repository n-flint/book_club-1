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
    name = params[:arg]
    @reviews = Review.where(username: name)
  end

private
  def review_params
    rp = params.require(:review).permit(:heading, :score, :full_review, :username)
    rp[:username].titleize
    rp
  end
end
