class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { maximum: 75}
  validates :page_count, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :pub_year, presence: true, numericality: {greater_than: 1000, less_than: 2030, only_integer: true}
  validates :thumbnail_url, presence: true

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
