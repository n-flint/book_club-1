require 'rails_helper'

RSpec.describe 'new book workflow' do
  it "creates a new book when form is filled and submitted" do
    visit books_path
    click_link "Add book"

    expect(current_path).to eq(new_book_path)
    fill_in "book[title]", with: "My crappy book"
    fill_in "book[pub_year]", with: 2019
    fill_in "book[page_count]", with: 1
    fill_in "book[thumbnail_url]", with: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
    fill_in "book[authors]", with: "Jeremy"
    click_button "Create Book"
  end
end
