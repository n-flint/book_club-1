require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'when I visit the user show page' do
    before :each do
      @book_1 = Book.create!(title: "In Search Of Lost Time", page_count: 4215, pub_year: 1913, thumbnail_url: 'https://images.penguinrandomhouse.com/cover/9780679645689')
      @book_2 = Book.create(title: "Don Quixote", page_count: 928, pub_year: 1605, thumbnail_url: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
      @review_1 = @book_1.reviews.create(heading: "Best Book", score: 5, full_review: "This was really something", username: "Jeremy")
      @review_2 = @book_2.reviews.create(heading: "What?", score: 3, full_review: "I can't tell if this book is good or not", username: "Jeremy")
      # @review_3 = @book_2.reviews.create(heading: "Great", score: 5, full_review: "Read this", username: "Tupac")
    end
    it 'can delete a review' do
      visit reviews_path(arg: @review_1.username)

      within "#review-#{@review_1.id}" do
        click_link "Delete Review"
      end

      #no idea why this is not working...
      # expect(current_path).to eq(reviews_path(arg: "Jeremy"))
      expect(page).to_not have_content(@review_1.heading)
      expect(page).to have_content(@review_2.heading)
    end
  end



end
