class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :score
      t.string :heading
      t.text :full_review
      t.string :username
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
