class Author < ApplicationRecord
  has_many :author_books, dependent_destroy: true
  has_many :books, through: :author_books 
end