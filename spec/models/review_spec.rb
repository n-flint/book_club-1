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
        @review_3 = @book_2.reviews.create(heading: "Best Book", score: 5, full_review: "This was really something", username: "Jeremy")
        @review_2 = @book_2.reviews.create(heading: "What?", score: 3, full_review: "I can't tell if this book is good or not", username: "Tupac")
        @review_1 = @book_1.reviews.create(heading: "Great", score: 5, full_review: "Read this", username: "Tupac")
      end
      it '.newest' do
        expected = [@review_3, @review_2, @review_1]
        actual = Review.newest

        expect(actual).to eq(expected)
      end

      it '.oldest' do
        expected = [@review_1, @review_2, @review_3]
        actual = Review.oldest

        expect(actual).to eq(expected)
      end
    end

end
