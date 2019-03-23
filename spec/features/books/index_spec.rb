require 'rails_helper'


RSpec.describe 'in user index', type: :feature do
  it 'user can see all books' do
    book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
                         page_count: 247,
                         pub_year: 2013,
                         thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
    book_2 = Book.create(title: "Perepolis Rising",
                         page_count: 583,
                         pub_year: 2017,
                         thumbnail_url: "https://upload.wikimedia.org/wikipedia/en/f/f5/Persepolis_Rising.jpg")


    visit '/books'

    expect(page).to have_link("#{book_1.title}")
    # expect(page).to have_content("Author: #{book_1.author}")
    expect(page).to have_content("Pages: #{book_1.page_count}")
    expect(page).to have_content("Publication Year: #{book_1.pub_year}")
    # expect(page).to have_content("Title: #{book_1.thumbnail_url}")
    expect(page).to have_content("Title: #{book_2.title}")
    # expect(page).to have_content("Author: #{book_2.author}")
    expect(page).to have_content("Pages: #{book_2.page_count}")
    expect(page).to have_content("Publication Year: #{book_2.pub_year}")
    # expect(page).to have_content("Title: #{book_2.thumbnail_url}")
  end
  
  it 'can click book title link to show page' do
    book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
                         page_count: 247,
                         pub_year: 2013,
                         thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
    visit books_path

    click_link "#{book_1.title}"

    expect(current_path).to eq(book_path(book_1))
  end
end
