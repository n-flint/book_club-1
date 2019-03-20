# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@default_cover = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6"
@cover_1 = "https://images.penguinrandomhouse.com/cover/9780679645689"
@cover_2 = "https://i.pinimg.com/originals/2e/42/d2/2e42d25ee87ad6bb5f512bd86e099233.jpg"
@cover_3 = "https://images-na.ssl-images-amazon.com/images/I/51wTLf4JVwL._SX384_BO1,204,203,200_.jpg"
@cover_4 = "https://images-na.ssl-images-amazon.com/images/I/51vv75oglyL._SX326_BO1,204,203,200_.jpg"
@cover_5 = "https://images-na.ssl-images-amazon.com/images/I/81vjde0JFHL.jpg"
@cover_6 = "https://images-na.ssl-images-amazon.com/images/I/41kUPvqlguL.jpg"
@cover_7 = "https://prodimage.images-bn.com/pimages/9780547928203_p0_v2_s550x406.jpg"
@cover_8 = "https://images-na.ssl-images-amazon.com/images/I/41KGl2FqeAL.jpg"
@cover_9 = "https://images-na.ssl-images-amazon.com/images/I/71IfUpZ8QXL.jpg"
@cover_10 = "https://images-na.ssl-images-amazon.com/images/I/81muDiETxIL.jpg"
@cover_11 = "https://images-na.ssl-images-amazon.com/images/I/51mug4WQPgL._SX327_BO1,204,203,200_.jpg"
@cover_12 = "https://images-na.ssl-images-amazon.com/images/I/811k9HNhaiL.jpg"

# @user_1 = User.create(name: "Tim Allen")
# @user_2 = User.create(name: "Scott Thomas")
# @user_3 = User.create(name: "Noah Flint")
# @user_4 = User.create(name: "Peregrine Balas")
# @user_5 = User.create(name: "Peter Lapicola")
# @user_6 = User.create(name: "Ian Douglas")
# @user_7 = User.create(name: "Megan McMahon")

@book_1 = Book.create(title: "In Search Of Lost Time", page_count: 4215, pub_year: 1913, thumbnail_url: @cover_1)
@book_1.authors.create(name: "Marcel Proust")

@book_2 = Book.create(title: "Don Quixote", page_count: 928, pub_year: 1605, thumbnail_url: @cover_2)
@book_2.authors.create(name: "Miguel de Cervantes")

@book_3 = Book.create(title: "Ulysses", page_count: 730, pub_year: 1922, thumbnail_url: @cover_3)
@book_3.authors.create(name: "James Joyce")

@book_4 = Book.create(title: "The Great Gatsby", page_count: 180, pub_year: 1925, thumbnail_url: @cover_4)
@book_4.authors.create(name: " F. Scott Fitzgerald")

@book_5 = Book.create(title: "Moby Dick", page_count: 752, pub_year: 1851, thumbnail_url: @cover_5)
@book_5.authors.create(name: "Herman Melville")

@book_6 = Book.create(title: "The Fellowship Of The Ring", page_count: 423, pub_year: 1954, thumbnail_url: @cover_6)
@book_6.authors.create(name: "J. R. R. Tolkien")

@book_7 = Book.create(title: "The Two Towers", page_count: 352, pub_year: 1954, thumbnail_url: @cover_7)
@book_7.authors.create(name: "J. R. R. Tolkien")

@book_8 = Book.create(title: "The Return Of The King", page_count: 416, pub_year: 1955, thumbnail_url: @cover_8)
@book_8.authors.create(name: "J. R. R. Tolkien")

@book_9 = Book.create(title: "The Call Of The Wild", page_count: 232, pub_year: 1903, thumbnail_url: @cover_9)
@book_9.authors.create(name: "Jack London")

@book_10 = Book.create(title: "The Talisman", page_count: 921, pub_year: 1984, thumbnail_url: @cover_10)
@book_10.authors.create(name: "Peter Straub, Stephen King")

@book_11 = Book.create(title: "The Art Of Happiness: A Handbook For Living", page_count: 207, pub_year: 1998, thumbnail_url: @cover_11)
@book_11.authors.create(name: "Dalai Lama, Howard C. Cutler")

@book_12 = Book.create(title: "Into The Wild", page_count: 224, pub_year: 1996, thumbnail_url: @cover_12)
@book_12.authors.create(name: "Jon Krakauer")

@review_1 = @book_1.reviews.create(heading: "Great", score: 5, full_review: "Read this", username: "Rob")
@review_2 = @book_2.reviews.create(heading: "Best Book", score: 5, full_review: "This was really something", username: "Jeremy")
@review_3 = @book_3.reviews.create(heading: "I just couldn't", score: 1, full_review: "I had issues with this book", username: "Noah")
@review_4 = @book_4.reviews.create(heading: "Pretty Good So Far", score: 3, full_review: "I spilled coffee on this and couldn't finish but I liked what I read", username: "Brian")
@review_5 = @book_5.reviews.create(heading: "Wordy", score: 2, full_review: "Too many words not enough pictures", username: "Tupac")
@review_6 = @book_6.reviews.create(heading: "I burned it", score: 2, full_review: "I was reading by candlelight and the book caught fire, so I can only give it two stars", username: "Earl")
@review_7 = @book_7.reviews.create(heading: "Good", score: 4, full_review: "Fun read for sure!", username: "Zac")
@review_8 = @book_8.reviews.create(heading: "I liked it", score: 4, full_review: "An entertaining read", username: "Zac")
@review_9 = @book_9.reviews.create(heading: "I recommend this", score: 4, full_review: "Not gonna lie, I liked it", username: "Earl")
@review_10 = @book_10.reviews.create(heading: "Cool plot", score: 4, full_review: "Good bokk with interesting characters and story", username: "Rob")
@review_11 = @book_11.reviews.create(heading: "Loads of fun", score: 4, full_review: "Keep this one by your bedside", username: "Rob")
@review_12 = @book_12.reviews.create(heading: "I liked it!", score: 4, full_review: "Cool idea for a book", username: "Jeremy")
@review_13 = @book_12.reviews.create(heading: "Worth it", score: 4, full_review: "This book was only $5 and it's worth every dollar, which again is $5 so it doesn't get a 5 for a score because I wouldn't have paid $6 for it but it was still really good", username: "Noah")
@review_14 = @book_12.reviews.create(heading: "Yes please!", score: 4, full_review: "I hope they write a sequal!", username: "Brian")
@review_15 = @book_12.reviews.create(heading: "Nah", score: 2, full_review: "Not for me, or people who like good books", username: "Tupac")
@review_16 = @book_11.reviews.create(heading: "Eh", score: 3, full_review: "Really so so", username: "Earl")
@review_17 = @book_11.reviews.create(heading: "Evil", score: 1, full_review: "This book is full of black magic and curses", username: "Zac")
@review_18 = @book_10.reviews.create(heading: "Lost interest", score: 2, full_review: "I just couldn't get into it", username: "Rob")
@review_19 = @book_9.reviews.create(heading: "5 stars", score: 5, full_review: "Two thumbs up, I mean WAAAAAY up!", username: "Jeremy")
@review_20 = @book_10.reviews.create(heading: "Oh yeah, get into this book!", score: 5, full_review: "Throw ya nose in here and explore a world beyond your wildest dreams!", username: "Rob")
@review_21 = @book_11.reviews.create(heading: "Good for one thing", score: 1, full_review: "I hated the book but it made a good fire", username: "Rob")
@review_22 = @book_8.reviews.create(heading: "I don't know what to think", score: 3, full_review: "This book asked so many questions and left me with no answers", username: "Jeremy")
@review_23 = @book_1.reviews.create(heading: "What?", score: 3, full_review: "I can't tell if this book is good or not", username: "Tupac")
@review_24 = @book_1.reviews.create(heading: "Interesting?", score: 3, full_review: "I think this book was good but also I don't know so maybe it wasn't?", username: "Brian")
@review_1 = @book_2.reviews.create(heading: "Dang", score: 2, full_review: "I left my lunch at home. WHOOPS, wrong forum for this.", username: "Noah")
@review_1 = @book_3.reviews.create(heading: "Not bad", score: 3, full_review: "Also not good. But that might be because I was trying to read it while driving and crashed my car.", username: "Rob")
@review_1 = @book_4.reviews.create(heading: "Not my strong suit", score: 2, full_review: "I'm more the street smart type so this was an experiment that went wrong, but I'm glad for the experience.", username: "Jeremy")
@review_1 = @book_5.reviews.create(heading: "$W337", score: 5, full_review: "L337 B00K", username: "Noah")
@review_1 = @book_6.reviews.create(heading: "This book.", score: 5, full_review: " This book changed my life, but only because time passed while I read it so even this review is changing my life. Oof, I need to sit down.", username: "Brian")
@review_1 = @book_7.reviews.create(heading: "OK", score: 3, full_review: "I SAID IT WAS OKAY WHAT MORE DO YOU WANT FROM ME? Sorry, I didn't realize caps lock was on and I don't feel like retyping all of that.", username: "Tupac")
