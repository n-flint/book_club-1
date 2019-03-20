class Author < ApplicationRecord
    validates_presence_of :name
    has_many :bookauthors
    has_many :books, through: :bookauthors
end