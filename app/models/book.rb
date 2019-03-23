class Book < ApplicationRecord
    validates_presence_of :title, :page_count, :pub_year, :thumbnail_url
    has_many :reviews
    has_many :bookauthors
    has_many :authors, through: :bookauthors

    def highest_three_reviews
      reviews.order(:score).last(3).reverse
    end

    def lowest_three_reviews
      reviews.order(:score).first(3)
    end

    def average_review_score
      raw_mean = reviews.average(:score).to_f
      raw_mean.round(2)
    end

    def review_count
      reviews.count
    end
end
