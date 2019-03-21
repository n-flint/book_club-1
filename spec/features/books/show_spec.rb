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

    visit books_path(book_1)

    expect(current_path).to eq('/books')
    expect(page).to have_content("Title: #{book_1.title}")
    expect(page).to have_content("Page Count: #{book_1.page_count}")
    expect(page).to have_content("Publication Year: #{book_1.pub_year}")

    visit books_path(book_2)

    expect(current_path).to eq('/books')
    expect(page).to have_content("Title: #{book_2.title}")
    expect(page).to have_content("Page Count: #{book_2.page_count}")
    expect(page).to have_content("Publication Year: #{book_2.pub_year}")
  end
end
