class AuthorsController < ApplicationController
    def show
        @author = Author.find(params[:id])
        @num_reviews = @author.books.map do |book|
          book.reviews.count
        end
    end

    def destroy
      author = Author.find(params[:id])
      author.books.each do |book|
        book.destroy
      end
      author.destroy
      redirect_to books_path
    end
end
