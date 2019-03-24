require 'rails_helper'

RSpec.describe Book, type: :model do
  before :each do
    @book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
                         page_count: 247,
                         pub_year: 2013,
                         thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
    @book_2 = Book.create(title: "Persepolis Rising",
                         page_count: 583,
                         pub_year: 2017,
                         thumbnail_url: "https://upload.wikimedia.org/wikipedia/en/f/f5/Persepolis_Rising.jpg")
    @author_1 = @book_1.authors.create(name: "Sandi Metz")
    @author_2 = @book_2.authors.create(name: "James S.A. Corey")
    @review_1a = @book_1.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')
    @review_1b = @book_1.reviews.create(score: 4, heading: 'awesome', full_review: 'code n stuff', username: 'Noah')
    @review_1c = @book_1.reviews.create(score: 2, heading: 'not good', full_review: 'wtf is ruby', username: 'Jeremy')
    @review_1d = @book_1.reviews.create(score: 1, heading: 'this is garbage', full_review: 'I know way more than Sandi', username: 'Ian')
    @review_2a = @book_2.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')
    @review_2b = @book_2.reviews.create(score: 3, heading: 'meh', full_review: 'just ok', username: 'Noah')
    @review_2c = @book_2.reviews.create(score: 2, heading: 'so loooong', full_review: 'who has time to read this', username: 'Jeremy')
    @review_2d = @book_2.reviews.create(score: 1, heading: 'space melodrama', full_review: 'Ian is not impressed', username: 'Ian')
  end
    describe "validations" do
        it { should validate_presence_of :title}
        it { should validate_presence_of :page_count}
        it { should validate_presence_of :pub_year}
        it { should validate_presence_of :thumbnail_url}
        it { should validate_numericality_of :page_count}
        it { should validate_numericality_of :pub_year}
        it { should validate_uniqueness_of :title}

    end

    describe "relationships" do
        it { should have_many :reviews}
        it { should have_many(:authors).through(:bookauthors)}
    end

    describe "instance methods" do
      it ".highest_three_reviews" do
        expect(@book_1.highest_three_reviews).to eq([@review_1a, @review_1b, @review_1c])
      end

      it ".lowest_three_reviews" do
        expect(@book_1.lowest_three_reviews).to eq([@review_1d, @review_1c, @review_1b])
      end

      it ".average_review_score" do
        expect(@book_1.average_review_score).to eq(3)
      end
    end
end
