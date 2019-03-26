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
    author_1 = book_1.authors.create(name: "Sandi Metz")
    author_2 = book_2.authors.create(name: "James S.A. Corey")
    review_3 = book_2.reviews.create(heading: "Best Book", score: 5, full_review: "This was really something", username: "Jeremy")
    review_2 = book_2.reviews.create(heading: "What?", score: 3, full_review: "I can't tell if this book is good or not", username: "Tupac")
    review_1 = book_1.reviews.create(heading: "Great", score: 5, full_review: "Read this", username: "Tupac")
    review_4 = book_1.reviews.create(heading: "Best Book", score: 1, full_review: "This was really something", username: "Jeremy")

    visit '/books'
    within "##{book_1.id}" do
      expect(page).to have_link("#{book_1.title}")
      expect(page).to have_content("Average score: 3")
      expect(page).to have_content("Total reviews: 2")
      expect(page).to have_content("Author(s): Sandi Metz")
      expect(page).to have_content("Pages: #{book_1.page_count}")
      expect(page).to have_content("Publication Year: #{book_1.pub_year}")
      # expect(page).to have_content("Title: #{book_1.thumbnail_url}")
    end
    within "##{book_2.id}" do
      expect(page).to have_content("Title: #{book_2.title}")
      expect(page).to have_content("Total reviews: 2")
      expect(page).to have_content("Author(s): James S.A. Corey")
      expect(page).to have_content("Pages: #{book_2.page_count}")
      expect(page).to have_content("Publication Year: #{book_2.pub_year}")
    # expect(page).to have_content("Title: #{book_2.thumbnail_url}")
    end
  end

  it 'can click book title link to show page' do
    book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
                         page_count: 247,
                         pub_year: 2013,
                         thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
    visit books_path
    within '#book-list' do
      click_link "#{book_1.title}"

      expect(current_path).to eq(book_path(book_1))
    end
  end

  it 'can click Most Pages link to sort by descending page length' do
    book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
      page_count: 247,
      pub_year: 2013,
      thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
    book_2 = Book.create(title: "Perepolis Rising",
      page_count: 583,
      pub_year: 2017,
      thumbnail_url: "https://upload.wikimedia.org/wikipedia/en/f/f5/Persepolis_Rising.jpg")

    visit books_path
    click_link('Most Pages')
    within '#book-list' do
        page.body.index(book_2.title) < page.body.index(book_1.title)
    end
  end

  it 'can click Least Pages link to sort by ascending page length' do
    book_1 = Book.create(title: "Practical Object-Oriented Design in Ruby",
      page_count: 247,
      pub_year: 2013,
      thumbnail_url: "https://static1.squarespace.com/static/5527cdbae4b0ee7b897c2111/t/5b36361a70a6adda8def0b21/1540126277150/POODR_2e_cover_low_res.jpg?format=300w")
    book_2 = Book.create(title: "Perepolis Rising",
      page_count: 583,
      pub_year: 2017,
      thumbnail_url: "https://upload.wikimedia.org/wikipedia/en/f/f5/Persepolis_Rising.jpg")

    visit books_path
    click_link('Least Pages')
    within '#book-list' do
      page.body.index(book_1.title) < page.body.index(book_2.title)
    end
  end

  it 'can click Highest Ratings to sort by descending rating order' do
    book_1 = Book.create!(title: "This is a book", page_count: 4215, pub_year: 1913, thumbnail_url: 'https://images.penguinrandomhouse.com/cover/9780679645689')
    book_2 = Book.create!(title: "And so is this!!", page_count: 928, pub_year: 1605, thumbnail_url: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
    review_3 = book_2.reviews.create(heading: "Best Book", score: 5, full_review: "This was really something", username: "Jeremy")
    review_2 = book_2.reviews.create(heading: "What?", score: 3, full_review: "I can't tell if this book is good or not", username: "Tupac")
    review_1 = book_1.reviews.create(heading: "Great", score: 5, full_review: "Read this", username: "Tupac")
    visit books_path
    click_link('Highest Ratings')

    within '#book-list' do
      page.body.index(book_1.title) < page.body.index(book_2.title)
    end
  end

  it 'can click Lowest Ratings to sort by ascending rating order' do
    book_1 = Book.create!(title: "This is a book", page_count: 4215, pub_year: 1913, thumbnail_url: 'https://images.penguinrandomhouse.com/cover/9780679645689')
    book_2 = Book.create!(title: "And so is this!!", page_count: 928, pub_year: 1605, thumbnail_url: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
    review_3 = book_2.reviews.create(heading: "Best Book", score: 5, full_review: "This was really something", username: "Jeremy")
    review_2 = book_2.reviews.create(heading: "What?", score: 3, full_review: "I can't tell if this book is good or not", username: "Tupac")
    review_1 = book_1.reviews.create(heading: "Great", score: 5, full_review: "Read this", username: "Tupac")
    visit books_path
    click_link('Lowest Ratings')
    within '#book-list' do
      page.body.index(book_2.title) < page.body.index(book_1.title)
    end
  end

  it 'can click Most Reviews to sort by descending rating order' do
    book_1 = Book.create!(title: "This is a book", page_count: 4215, pub_year: 1913, thumbnail_url: 'https://images.penguinrandomhouse.com/cover/9780679645689')
    book_2 = Book.create!(title: "And so is this!!", page_count: 928, pub_year: 1605, thumbnail_url: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
    review_3 = book_2.reviews.create(heading: "Best Book", score: 5, full_review: "This was really something", username: "Jeremy")
    review_2 = book_2.reviews.create(heading: "What?", score: 3, full_review: "I can't tell if this book is good or not", username: "Tupac")
    review_1 = book_1.reviews.create(heading: "Great", score: 5, full_review: "Read this", username: "Tupac")
    visit books_path
    click_link('Most Reviews')
      within '#book-list' do
          page.body.index(book_2.title) < page.body.index(book_1.title)
      end
  end

  it 'can click Least Reviews to sort by ascending rating order' do
    book_1 = Book.create!(title: "This is a book", page_count: 4215, pub_year: 1913, thumbnail_url: 'https://images.penguinrandomhouse.com/cover/9780679645689')
    book_2 = Book.create!(title: "And so is this!!", page_count: 928, pub_year: 1605, thumbnail_url: "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg")
    review_3 = book_2.reviews.create(heading: "Best Book", score: 5, full_review: "This was really something", username: "Jeremy")
    review_2 = book_2.reviews.create(heading: "What?", score: 3, full_review: "I can't tell if this book is good or not", username: "Tupac")
    review_1 = book_1.reviews.create(heading: "Great", score: 5, full_review: "Read this", username: "Tupac")
    visit books_path
    click_link('Least Reviews')
      within '#book-list' do
            page.body.index(book_1.title) < page.body.index(book_2.title)
      end
  end
end
