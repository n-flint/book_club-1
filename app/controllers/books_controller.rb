class BooksController < ApplicationController

  def index
    @stat_books = Book.all
    @user_reviews = Review.all
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
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.authors.delete
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
