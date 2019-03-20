class Bookauthor < ApplicationRecord
    validates_presence_of :author_id
    validates_presence_of :book_id
    belongs_to :book
    belongs_to :author
end