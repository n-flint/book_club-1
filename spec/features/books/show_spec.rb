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
    review_1a = book_1.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Jeremy')
    review_1b = book_1.reviews.create(score: 4, heading: 'awesome', full_review: 'code n stuff', username: 'Noah')
    review_2a = book_2.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Jeremy')
    review_2b = book_2.reviews.create(score: 3, heading: 'meh', full_review: 'just ok', username: 'Noah')
    visit book_path(book_1)

    expect(page).to have_content("Title: #{book_1.title}")
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



    visit book_path(book_2)

    expect(page).to have_content("Title: #{book_2.title}")
    expect(page).to have_content("Page Count: #{book_2.page_count}")
    expect(page).to have_content("Publication Year: #{book_2.pub_year}")
    expect(page).to have_content("Author(s):")
    expect(page).to have_content("#{author_2.name}")
    expect(page).to have_content("Reviews:")
    expect(page).to have_content("Review title: #{review_2a.heading}")
    expect(page).to have_content("Reviewed by: #{review_2a.username}")
    expect(page).to have_content("Rating: #{review_2a.score}")
    expect(page).to have_content("#{review_2a.full_review}")
    expect(page).to have_content("Review title: #{review_2b.heading}")
    expect(page).to have_content("Reviewed by: #{review_2b.username}")
    expect(page).to have_content("Rating: #{review_2b.score}")
    expect(page).to have_content("#{review_2b.full_review}")

    click_on('<< Back to Books Home')
    expect(current_path).to eq(books_path)
  end
end
