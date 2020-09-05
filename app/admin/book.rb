ActiveAdmin.register Book do
  
  filter :book_title
  filter :created_at

  permit_params :book_title
  index do
    selectable_column
    id_column
    column :book_title
    column :created_at

    actions
  end

  form do |f|
    f.inputs do
      f.input :book_title
      label 'Select Author'
      f.select :authors, options_for_select(Author.all.map{ |author| [author.full_name, author.id] })
    end
    f.actions
  end

  controller do
    before_action :set_author, only: %w(create)

    def create
      @book = Book.create(book_params.except(:authors))
      @book.author_books.create(author: @author)
      redirect_to admin_books_path, notice: 'Book created successfully'
    end

    private

    def book_params
      params.require(:book).permit(:book_title, :authors)
    end

    def set_author
      @author = Author.find_by(id: book_params[:authors])
    end
  end

  show do
    attributes_table_for book do
      row :book_title
      table_for book&.authors do
        book&.authors.each_with_index do |author, index|
          column(:author_id) { |author| author.id }
          column(:author_name) { |author| author.full_name }
        end
      end
    end
  end

end