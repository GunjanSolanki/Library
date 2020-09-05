class CreateAuthorBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :author_books do |t|
      t.references :author, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
