class Author < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books 

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end