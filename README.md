# Library

This app can be used for library management or as a publishing house:
- Admin user can create authors & books 
- Add books to authors.
- Have an Admin Interface.
- Consists of APIs to get details of your favourite author along with his books.

To Run the App :

- run rails db:create db:migrate db:seed
- run rails s
- Admin panel can be accessed at https://localhost:3000/admin
- API endpoint to get author details :
  http://localhost:3000/api/v1/authors/:author_id
