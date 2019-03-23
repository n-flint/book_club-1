class BooksController < ApplicationController

  def index
    if params[:sort] == "descending_pages"
      @books = Book.order(page_count: :desc)
    elsif params[:sort] == "ascending_pages"
      @books = Book.order(page_count: :asc)
    elsif params[:sort] == "descending_rating"
      ordered_books = Book.all
      @books = ordered_books.sort_by do |book|
        book.average_review_score
      end.reverse
    elsif params[:sort] == "ascending_rating"
      ordered_books = Book.all
      @books = ordered_books.sort_by do |book|
        book.average_review_score
      end
    elsif params[:sort] == "descending_reviews"
      ordered_books = Book.all
      @books = ordered_books.sort_by do |book|
        book.review_count
      end.reverse
    elsif params[:sort] == "ascending_reviews"
      ordered_books = Book.all
      @books = ordered_books.sort_by do |book|
        book.review_count
      end
    else
      @books = Book.all
    end
  end

  def show
   @book = Book.find(params[:id])
  end
end
