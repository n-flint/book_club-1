require 'rails_helper'

RSpec.describe Book, type: :model do
  before :each do
    @book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
                         page_count: 247,
                         pub_year: 2013,
                         thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
    @book_2 = Book.create!(title: "Persepolis Rising",
                         page_count: 583,
                         pub_year: 2017,
                         thumbnail_url: "https://upload.wikimedia.org/wikipedia/en/f/f5/Persepolis_Rising.jpg")
    @book_3 = Book.create!(title: "In Search Of Lost Time", page_count: 4215, pub_year: 1913, thumbnail_url: 'https://images.penguinrandomhouse.com/cover/9780679645689')
    @book_4 = Book.create!(title: "Don Quixote", page_count: 928, pub_year: 1605, thumbnail_url: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
    @author_1 = @book_1.authors.create(name: "Sandi Metz")
    @author_2 = @book_2.authors.create(name: "James S.A. Corey")
    @review_1a = @book_1.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')
    @review_1b = @book_1.reviews.create(score: 4, heading: 'awesome', full_review: 'code n stuff', username: 'Noah')
    @review_1c = @book_1.reviews.create(score: 2, heading: 'not good', full_review: 'wtf is ruby', username: 'Jeremy')
    @review_1d = @book_1.reviews.create(score: 1, heading: 'this is garbage', full_review: 'I know way more than Sandi', username: 'Ian')
    @review_1e = @book_1.reviews.create(score: 3, heading: 'this is garbage', full_review: 'I know way more than Sandi', username: 'Ian')
    @review_2a = @book_2.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')
    @review_2b = @book_2.reviews.create(score: 3, heading: 'meh', full_review: 'just ok', username: 'Noah')
    @review_2c = @book_2.reviews.create(score: 2, heading: 'so loooong', full_review: 'who has time to read this', username: 'Jeremy')
    @review_2d = @book_2.reviews.create(score: 1, heading: 'space melodrama', full_review: 'Ian is not impressed', username: 'Ian')
    @review_3a = @book_3.reviews.create(score: 5, heading: 'so loooong', full_review: 'who has time to read this', username: 'Jeremy')
    @review_3b = @book_3.reviews.create(score: 5, heading: 'space melodrama', full_review: 'Ian is not impressed', username: 'Jeremy')
    @review_4a = @book_4.reviews.create(score: 4, heading: 'test it loooong', full_review: 'who has time to read this', username: 'Jeremy')
    @review_4b = @book_4.reviews.create(score: 4, heading: 'test it good', full_review: 'test it test it real goooooodd', username: 'Jeremy')
    @review_4c = @book_4.reviews.create(score: 4, heading: 'test it good', full_review: 'test it test it real goooooodd', username: 'Jeremy')

  end

    describe "validations" do
        it { should validate_presence_of :title}
        it { should validate_presence_of :page_count}
        it { should validate_presence_of :pub_year}
        it { should validate_numericality_of :page_count}
        it { should validate_numericality_of :pub_year}
        it { should validate_uniqueness_of :title}
    end

    describe "relationships" do
        it { should have_many :reviews}
        it { should have_many(:authors).through(:bookauthors)}
    end

    describe "before save" do
      it "adds default thumbnail_url" do
        book_3 = Book.create!(title: "Stupid Book",
                             page_count: 583,
                             pub_year: 2017,
                             thumbnail_url: "")
        expected = book_3.thumbnail_url
        expect(expected).to eq("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6")
      end
    end

    describe "instance methods" do
      it "#highest_three_reviews" do
        expect(@book_1.highest_three_reviews).to eq([@review_1a, @review_1b, @review_1e])
      end

      it "#lowest_three_reviews" do
        expect(@book_1.lowest_three_reviews).to eq([@review_1d, @review_1c, @review_1e])
      end

      it "#average_review_score" do
        expect(@book_1.average_review_score).to eq(3)
      end

      it ".coauthors" do
        book_1 = Book.create!(title: "Testy testes Book", page_count: 420, pub_year: 1348, thumbnail_url: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
        author_1 = book_1.authors.create(name: "Sandi Metz")
        author_2 = book_1.authors.create(name: "Bob Ross")
        author_3 = book_1.authors.create(name: "Johnny Tsunami")

        expect(book_1.coauthors(author_1)).to eq([author_2, author_3])
      end
    end

    describe 'class methods' do
        it ".highest_three_scores" do
          expect(Book.highest_three_scores).to eq([@book_3, @book_4, @book_1])
        end

        it ".lowest_three_scores" do
          expect(Book.lowest_three_scores).to eq([@book_2, @book_1, @book_4])
        end

        it ".descending_pages" do
          expect(Book.descending_pages).to eq([@book_3, @book_4, @book_2, @book_1])
        end

        it ".ascending_pages" do
          expect(Book.ascending_pages).to eq([@book_1, @book_2, @book_4, @book_3])
        end

        it ".descending_rating" do
          expect(Book.descending_rating).to  eq([@book_3, @book_4, @book_1, @book_2])
        end

        it ".ascending_rating" do
          expect(Book.ascending_rating).to eq([@book_2, @book_1, @book_4, @book_3])
        end

        it ".descending_reviews" do
          expect(Book.descending_reviews).to eq([@book_1, @book_2, @book_4, @book_3])
        end

        it ".ascending_reviews" do
          expect(Book.ascending_reviews).to eq([@book_3, @book_4, @book_2, @book_1])
        end
    end


end
