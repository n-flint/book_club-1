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
end
