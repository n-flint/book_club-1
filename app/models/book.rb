class Book < ApplicationRecord
    validates_presence_of :title, :page_count, :pub_year, :thumbnail_url
    has_many :reviews
    has_many :bookauthors
    has_many :authors, through: :bookauthors

    def highest_three_reviews
      reviews.order(:score).last(3).reverse
    end
end
