class Review < ApplicationRecord
    belongs_to :book
    validates_presence_of :heading, :score, :full_review, :username, :book_id
end