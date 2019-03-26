class BooksController < ApplicationController

  def index
    @stat_books = Book.all
    @user_reviews = Review.all
    if params[:sort] == "descending_pages"
      @books = Book.all.descending_pages
    elsif params[:sort] == "ascending_pages"
      @books = Book.all.ascending_pages
    elsif params[:sort] == "descending_rating"
      @books = Book.all.descending_rating
    elsif params[:sort] == "ascending_rating"
      @books = Book.all.ascending_rating
    elsif params[:sort] == "descending_reviews"
      @books = Book.all.descending_reviews
    elsif params[:sort] == "ascending_reviews"
      @books = Book.all.ascending_reviews
    else
      @books = Book.all
    end
  end

  def show
   @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
      if @book.save
      author_params[:authors].split(',').each do |author_param|
        @book.authors.find_or_create_by(name: author_param.strip)
      end
      redirect_to book_path(@book)
    else
      redirect_to new_book_path, alert: @book.errors.full_messages
    end
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :pub_year, :page_count, :thumbnail_url)
  end

  def author_params
    params.permit(:authors)
  end
end
