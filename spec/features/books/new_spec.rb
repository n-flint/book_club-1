require 'rails_helper'

RSpec.describe 'new book workflow' do
  context "happy path" do
    it "creates a new book when form is filled and submitted" do
      visit books_path
      click_link "Add book"

      expect(current_path).to eq(new_book_path)
      fill_in "book[title]", with: "My crappy book"
      fill_in "book[pub_year]", with: 2019
      fill_in "book[page_count]", with: 1
      fill_in "book[thumbnail_url]", with: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
      fill_in "authors", with: "jeremy, noah, rob"
      click_button "Create Book"
      new_book = Book.last
      expect(current_path).to eq(book_path(new_book.id))
      expect(page).to have_content("Title: #{new_book.title}")
      expect(page).to have_content("Publication Year: #{new_book.pub_year}")
      expect(page).to have_content("Page Count: #{new_book.page_count}")
      expect(page).to have_content("Author(s): Jeremy Noah Rob")
    end

    it "adds default thumbnail_url" do
      visit books_path
      click_link "Add book"

      expect(current_path).to eq(new_book_path)
      fill_in "book[title]", with: "My crappy book"
      fill_in "book[pub_year]", with: 2019
      fill_in "book[page_count]", with: 1
      fill_in "authors", with: "jeremy, noah, rob"
      click_button "Create Book"
      new_book = Book.last
      expect(current_path).to eq(book_path(new_book.id))
      expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6']")
    end
  end
  context "sad path" do
    it "doesn't generate a record if field is blank" do
      visit new_book_path

      fill_in "book[pub_year]", with: 2019
      fill_in "book[page_count]", with: 1
      fill_in "book[thumbnail_url]", with: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
      fill_in "authors", with: "Jeremy"
      click_button "Create Book"
      expect(current_path).to eq(new_book_path)
    end

    it "should not allow invalid inputs" do
      visit new_book_path

      book_2 = Book.create(title: "Persepolis Rising",
                           page_count: 583,
                           pub_year: 2017,
                           thumbnail_url: "https://upload.wikimedia.org/wikipedia/en/f/f5/Persepolis_Rising.jpg")

     fill_in "book[title]", with: "Persepolis Rising"
     fill_in "book[pub_year]", with: 2017
     fill_in "book[page_count]", with: 583
     fill_in "book[thumbnail_url]", with: "https://upload.wikimedia.org/wikipedia/en/f/f5/Persepolis_Rising.jpg"
     fill_in "authors", with: "jeremy, noah, rob"
     click_button "Create Book"
     expect(current_path).to eq(new_book_path)
    end
  end
end
