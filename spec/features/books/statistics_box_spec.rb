describe 'a visitor sees the book index statistics box' do
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
    @author_2 = @book_2.authors.create(name: "James S.A. Corey")
    @review_1a = @book_1.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Rob')
    @review_1b = @book_1.reviews.create(score: 4, heading: 'awesome', full_review: 'code n stuff', username: 'Noah')
    @review_1c = @book_1.reviews.create(score: 2, heading: 'not good', full_review: 'wtf is ruby', username: 'Jeremy')
    @review_1d = @book_1.reviews.create(score: 1, heading: 'this is garbage', full_review: 'I know way more than Sandi', username: 'Ian')
    @review_2a = @book_2.reviews.create(score: 5, heading: 'epic', full_review: 'nerd out', username: 'Bob')
    @review_2b = @book_2.reviews.create(score: 3, heading: 'meh', full_review: 'just ok', username: 'Rob')
    @review_2c = @book_2.reviews.create(score: 2, heading: 'so loooong', full_review: 'who has time to read this', username: 'Jeremy')
    @review_2d = @book_2.reviews.create(score: 1, heading: 'space melodrama', full_review: 'Ian is not impressed', username: 'Noah')
    @review_3a = @book_3.reviews.create(score: 5, heading: 'so loooong', full_review: 'who has time to read this', username: 'Jeremy')
    @review_3b = @book_3.reviews.create(score: 5, heading: 'space melodrama', full_review: 'Ian is not impressed', username: 'Jeremy')
    @review_4a = @book_4.reviews.create(score: 4, heading: 'test it loooong', full_review: 'who has time to read this', username: 'Ian')
    @review_4b = @book_4.reviews.create(score: 4, heading: 'test it good', full_review: 'test it test it real goooooodd', username: 'Ian')
  end

  it 'should display the top 3 highest rated books' do
    visit books_path

    within "#top-rated" do
        expect(page).to have_content(@book_3.title)
        expect(page).to have_content(@book_3.average_review_score)
        expect(page).to have_content(@book_4.title)
        expect(page).to have_content(@book_4.average_review_score)
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.average_review_score)
        expect(page).to_not have_content(@book_2.title)
        expect(page).to_not have_content(@book_2.average_review_score)
    end

    within "#lowest-rated" do
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(@book_2.average_review_score)
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.average_review_score)
        expect(page).to have_content(@book_4.title)
        expect(page).to have_content(@book_4.average_review_score)
        expect(page).to_not have_content(@book_3.title)
        expect(page).to_not have_content(@book_3.average_review_score)
    end

    within '#user-review-stats' do
        expect(page).to have_link('Jeremy')
        expect(page).to have_content('Review Count: 4')
        expect(page).to have_content('User: Ian')
        expect(page).to have_content('Review Count: 3')
        expect(page).to have_content('User: Noah')
        expect(page).to have_content('Review Count: 2')
    end
  end
  it ' username is link to show page' do
    visit books_path

    within '#user-review-stats' do
      click_link "#{@review_3b.username}"
    end

    # expect(current_path).to eq(reviews_path(arg: @review_3b.username))
  end
end
