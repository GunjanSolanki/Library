ActiveAdmin.register Author do
  
  filter :first_name
  filter :last_name
  filter :date_of_birth
  filter :created_at

  permit_params :first_name, :last_name, :date_of_birth
  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :date_of_birth
    column :created_at

    actions
  end
  
  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      label 'Date Of Birth'
      f.date_field :date_of_birth
    end
    f.actions
  end

  show do
    attributes_table_for author do
      row :first_name
      row :last_name
      row :date_of_birth
      table_for author&.books do
        author&.books.each_with_index do |book, index|
          column(:book_id) { |book| book.id }
          column(:book_title) { |book| book.book_title }
        end
      end
    end
  end
end