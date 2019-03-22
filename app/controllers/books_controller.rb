class BooksController < ApplicationController

  def index
    if params[:sort] == "descending_pages"
      @books = Book.order(page_count: :desc)
    elsif params[:sort] == "ascending_pages"
      @books = Book.order(page_count: :asc)
    else
      @books = Book.all
    end
  end

  def show
   @book = Book.find(params[:id])
  end
end
