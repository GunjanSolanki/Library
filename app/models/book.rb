class Book < ApplicationRecord
  has_many :author_books, dependent_destroy: true
  has_many :authors, through: :author_books
end