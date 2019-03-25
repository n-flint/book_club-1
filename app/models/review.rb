class Review < ApplicationRecord
    belongs_to :book
    validates_presence_of :heading, :score, :full_review, :username, :book_id

    before_save {self.username = self.username.titleize}

  def self.newest
    order(created_at: :asc)
  end

  def self.oldest
    order(created_at: :desc)
  end

  def self.top_three_reviewers
    review_groups = Review.all.group_by {|review| review.username}
    
    reviewer_count = review_groups.each do |key, value|
      review_groups[key] = value.count 
    end

    sorted_reviewers = reviewer_count.sort_by {|reviewer, count| count}

    sorted_reviewers.reverse[0..2]

  end
end
