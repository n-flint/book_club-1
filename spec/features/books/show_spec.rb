require 'rails_helper'

RSpec.describe 'in book show page', type: :feature do
  it 'shows the book attributes' do
    book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
                         page_count: 247,
                         pub_year: 2013,
                         thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
    book_2 = Book.create(title: "Persepolis Rising",
                         page_count: 583,
                         pub_year: 2017,
                         thumbnail_url: "https://upload.wikimedia.org/wikipedia/en/f/f5/Persepolis_Rising.jpg")
    author_1 = book_1.authors.create(name: "Sandi Metz")
    author_2 = book_2.authors.create(name: "James S.A. Corey")
    review_1a = book_1.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')
    review_1b = book_1.reviews.create(score: 4, heading: 'awesome', full_review: 'code n stuff', username: 'Noah')
    review_1c = book_1.reviews.create(score: 2, heading: 'not good', full_review: 'wtf is ruby', username: 'Jeremy')
    review_1d = book_1.reviews.create(score: 1, heading: 'this is garbage', full_review: 'I know way more than Sandi', username: 'Ian')
    review_2a = book_2.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')
    review_2b = book_2.reviews.create(score: 3, heading: 'meh', full_review: 'just ok', username: 'Noah')
    review_2c = book_2.reviews.create(score: 2, heading: 'so loooong', full_review: 'who has time to read this', username: 'Jeremy')
    review_2d = book_2.reviews.create(score: 1, heading: 'space melodrama', full_review: 'Ian is not impressed', username: 'Ian')

    visit book_path(book_1)
    expect(page).to have_content("Title: #{book_1.title}")
    expect(page).to have_content("Average Review Score: #{book_1.average_review_score}")
    expect(page).to have_content("Total Reviews: #{book_1.review_count}")
    expect(page).to have_content("Page Count: #{book_1.page_count}")
    expect(page).to have_content("Publication Year: #{book_1.pub_year}")
    expect(page).to have_content("Author(s):")
    expect(page).to have_content("Reviews:")
    expect(page).to have_content("Review title: #{review_1a.heading}")
    expect(page).to have_content("Reviewed by: #{review_1a.username}")
    expect(page).to have_content("Rating: #{review_1a.score}/5")
    expect(page).to have_content("#{review_1a.full_review}")
    expect(page).to have_content("Review title: #{review_1b.heading}")
    expect(page).to have_content("Reviewed by: #{review_1b.username}")
    expect(page).to have_content("Rating: #{review_1b.score}/5")
    expect(page).to have_content("#{review_1b.full_review}")
    within '#review-stats' do
      expect(page).to have_content("Review Stats:")
      expect(page).to have_content("Highest 3 Reviews:")
      within '#highest' do
        expect(page).to have_content("#{review_1a.heading}")
        expect(page).to have_content("#{review_1a.score}")
        expect(page).to have_content("#{review_1a.username}")
        expect(page).to have_content("#{review_1b.heading}")
        expect(page).to have_content("#{review_1b.score}")
        expect(page).to have_content("#{review_1b.username}")
        expect(page).to have_content("#{review_1c.heading}")
        expect(page).to have_content("#{review_1c.score}")
        expect(page).to have_content("#{review_1c.username}")
        expect(page).to_not have_content("#{review_1d.heading}")
        expect(page).to_not have_content("#{review_1d.username}")
        expect(page).to_not have_content("#{review_1d.score}")
      end
      expect(page).to have_content("Lowest 3 Reviews:")
      within '#lowest' do
        expect(page).to have_content("#{review_1b.heading}")
        expect(page).to have_content("#{review_1b.score}")
        expect(page).to have_content("#{review_1b.username}")
        expect(page).to have_content("#{review_1c.heading}")
        expect(page).to have_content("#{review_1c.score}")
        expect(page).to have_content("#{review_1c.username}")
        expect(page).to have_content("#{review_1d.username}")
        expect(page).to have_content("#{review_1d.heading}")
        expect(page).to have_content("#{review_1d.score}")
      end
    end

    click_on('<< Back to Books Home')
    expect(current_path).to eq(books_path)
  end

  it 'can delete a book' do
    book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
                         page_count: 247,
                         pub_year: 2013,
                         thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
    author_1 = book_1.authors.create(name: "Sandi Metz")
    review_1a = book_1.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')
    book_2 = Book.create(title: "Persepolis Rising",
                         page_count: 583,
                         pub_year: 2017,
                         thumbnail_url: "https://upload.wikimedia.org/wikipedia/en/f/f5/Persepolis_Rising.jpg")
    author_2 = book_2.authors.create(name: "James S.A. Corey")
    review_2a = book_2.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')

    visit book_path(book_1)
    click_on "Delete Book"

    expect(current_path).to eq(books_path)
    expect(page).to have_content("#{book_2.title}")
    expect(page).to_not have_content("#{book_1.title}")
  end
end
