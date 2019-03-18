require 'rails_helper'

RSpec.describe 'in user index', type: :feature do
  it 'user can see all books' do
    book_1 = Book.create(:title, :author, :page_count, :pub_year, :thumbnail_url)
    book_2 = Book.create(:title, :author, :page_count, :pub_year, :thumbnail_url)

    visit '/books'

    expect(page).to have_content("Title: #{book_1.title}")
    expect(page).to have_content("Author: #{book_1.author}")
    expect(page).to have_content("Pages: #{book_1.page_count}")
    expect(page).to have_content("Publication Year: #{book_1.pub_year}")
    # expect(page).to have_content("Title: #{book_1.thumbnail_url}")
    expect(page).to have_content("Title: #{book_2.title}")
    expect(page).to have_content("Author: #{book_2.author}")
    expect(page).to have_content("Pages: #{book_2.page_count}")
    expect(page).to have_content("Publication Year: #{book_2.pub_year}")
    # expect(page).to have_content("Title: #{book_2.thumbnail_url}")
  end
end
