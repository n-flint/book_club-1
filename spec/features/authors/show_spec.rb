require 'rails_helper'

RSpec.describe 'When a user visits the author show page', type: :feature do
  before(:each) do
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
    @author_2 = @book_1.authors.create(name: "James S.A. Corey")
    @author_3 = @book_4.authors.create(name: "Bob Ross")
    @author_1.books << @book_3
    # @book_1.authors << @author_2
    @review_1a = @book_1.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')
    @review_1b = @book_1.reviews.create(score: 4, heading: 'awesome', full_review: 'code n stuff', username: 'Noah')
    @review_2a = @book_2.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Bob')
    @review_2b = @book_2.reviews.create(score: 3, heading: 'meh', full_review: 'just ok', username: 'Rob')
    @review_3a = @book_3.reviews.create(score: 5, heading: 'so loooong', full_review: 'who has time to read this', username: 'Jeremy')
    @review_3b = @book_3.reviews.create(score: 5, heading: 'space melodrama', full_review: 'Ian is not impressed', username: 'Jeremy')
    @review_4a = @book_4.reviews.create(score: 4, heading: 'test it loooong', full_review: 'who has time to read this', username: 'Ian')
    @review_4b = @book_4.reviews.create(score: 4, heading: 'test it good', full_review: 'test it test it real goooooodd', username: 'Ian')
  end


  it 'should show the book title' do
    visit author_path(@author_1)

    expect(page).to have_content(@author_1.name)

    within "##{@book_1.id}" do
        expect(page).to have_link(@book_1.title)
        expect(page).to have_content(@book_1.page_count)
        expect(page).to have_content(@book_1.pub_year)
        expect(page).to have_xpath("//img[@src='https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w']")
        expect(page).to have_content(@author_2.name)
        expect(page).to_not have_content(@author_1.name)
    end

    within "##{@book_3.id}" do
        expect(page).to have_link(@book_3.title)
        expect(page).to have_content(@book_3.page_count)
        expect(page).to have_content(@book_3.pub_year)
        expect(page).to have_xpath("//img[@src='https://images.penguinrandomhouse.com/cover/9780679645689']")
    end
  end

  it 'should show top review for each book' do
    visit author_path(@author_1)

    within "##{@book_1.id}" do
        expect(page).to have_content(@review_1a.heading)
        expect(page).to have_content(@review_1a.score)
        expect(page).to have_content(@review_1a.username)
        expect(page).to_not have_content(@review_1b.heading)
    end
  end

  it 'can delete an author' do
    visit author_path(@author_3)
    expect(Book.all.count).to eq(4)
    click_link "Delete Author"
    expect(current_path).to eq(books_path)
    expect(page).to_not have_content(@book_4.title)
    expect(page).to have_content(@book_2.title)
    expect(Book.all.count).to eq(3)

    book_5 = Book.create!(title: "This better work",
                        page_count: 123,
                        pub_year: 2019,
                        thumbnail_url: "")
    review_10 = book_5.reviews.create(score: 5, heading: "Cool", full_review: "great stuff", username: "Jean-Luc Picard")
    author_3 = book_5.authors.create(name: "Jeremy")
    author_4 = book_5.authors.create(name: "Noah")
    author_5 = book_5.authors.create(name: "Rob")
    visit author_path(author_3)
    click_on "Delete Author"
    expect(current_path).to eq(books_path)
    binding.pry
    expect(page).to have_content("#{@book_2.title}")
    expect(page).to_not have_content("#{book_5.title}")
  end
end
