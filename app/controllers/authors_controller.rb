class AuthorsController < ApplicationController
    def show
        @author = Author.find(params[:id])
    end

    def destroy
      author = Author.find(params[:id])
      author.books.destroy_all 
      redirect_to books_path
    end
end
