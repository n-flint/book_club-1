class ChangeBookAuthorsToBookauthors < ActiveRecord::Migration[5.2]
  def change
    rename_table :book_authors, :bookauthors 
  end
end
