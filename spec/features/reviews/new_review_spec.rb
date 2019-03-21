require 'rails_helper'

RSpec.describe "as a visitor" do
  before :each do
    @book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
                         page_count: 247,
                         pub_year: 2013,
                         thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
  end

  it 'can create a new review' do
    visit book_path(@book_1)

    click_link "Add Review"

    expect(current_path).to eq(new_book_review_path(@book_1))

    fill_in "review[heading]", with: "Meh..."
    fill_in "review[score]", with: 2
    fill_in "review[full_review]", with: "By far, the most average book I have ever read"
    fill_in "review[username]", with: "Noah"

    click_button "Create Review"
    new_review = Review.last

    expect(current_path).to eq(book_path(@book_1))
    expect(new_review.book).to eq(@book_1)
    expect(new_review.heading).to eq("Meh...")
  end
end
