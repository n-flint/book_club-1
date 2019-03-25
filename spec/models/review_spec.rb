require 'rails_helper'

RSpec.describe Review, type: :model do
    describe 'validations' do
        it { should validate_presence_of :heading}
        it { should validate_presence_of :score}
        it { should validate_presence_of :full_review}
        it { should validate_presence_of :username}
        it { should validate_presence_of :book_id}
    end

    describe 'relationships' do
        it { should belong_to :book}
    end

    describe 'class methods' do
      before :each do
        @book_1 = Book.create!(title: "In Search Of Lost Time", page_count: 4215, pub_year: 1913, thumbnail_url: 'https://images.penguinrandomhouse.com/cover/9780679645689')
        @book_2 = Book.create(title: "Don Quixote", page_count: 928, pub_year: 1605, thumbnail_url: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
        @review_1 = @book_1.reviews.create(heading: "Change a thing", score: 5, full_review: "Read this", username: "Tupac")
        @review_2 = @book_2.reviews.create(heading: "to change a timestamp", score: 3, full_review: "I can't tell if this book is good or not", username: "Tupac")
        @review_3 = @book_2.reviews.create(heading: "and change the world", score: 5, full_review: "This was really something", username: "Jeremy")
        @review_4 = @book_1.reviews.create(heading: "write more things", score: 5, full_review: "do a thing", username: "Jeremy")
        @review_5 = @book_2.reviews.create(heading: "about more books", score: 5, full_review: "go for it", username: "Jeremy")
        @review_6 = @book_1.reviews.create(heading: "to make more test data", score: 5, full_review: "do it again", username: "Jeremy")
        @review_7 = @book_2.reviews.create(heading: "and help update the tests", score: 5, full_review: "dont stop", username: "Tupac")
        @review_8 = @book_2.reviews.create(heading: "keep it chronological", score: 5, full_review: "dont stop", username: "Noah")
        @review_9 = @book_2.reviews.create(heading: "and edit it sequentially", score: 5, full_review: "dont stop", username: "Noah")
        @review_10 = @book_1.reviews.create(heading: "maybe the tests will pass?", score: 1, full_review: "it is so fun, never stop", username: "Rob")
      end
      it '.newest' do
        expected = [@review_1, @review_2, @review_3, @review_4, @review_5, @review_6, @review_7, @review_8, @review_9, @review_10]
        actual = Review.newest
  
        expect(actual).to eq(expected)
      end

      it '.oldest' do
        expected = [@review_10, @review_9, @review_8, @review_7, @review_6, @review_5, @review_4, @review_3, @review_2, @review_1]
        actual = Review.oldest

        expect(actual).to eq(expected)
      end

      it '.top_three_reviewers' do
        expected = [["Jeremy", 4], ["Tupac", 3], ["Noah", 2]]
        actual = Review.top_three_reviewers

        expect(actual).to eq(expected)
      end
    end

end
