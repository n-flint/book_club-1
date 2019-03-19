class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :page_count
      t.integer :pub_year
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
