class CreateAuthorBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :author_books do |t|
      t.string :author_id
      t.string :book_id

      t.timestamps
    end
  end
end
