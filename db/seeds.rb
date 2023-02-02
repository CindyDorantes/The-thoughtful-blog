# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=785&q=80', bio: 'Teacher from Mexico.', email: 'tom@gmail.com')
# second_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1614701466929-766271250d48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NXwzNjc4OTAyfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60', bio: 'Teacher from Poland.')

first_user = User.create(email: 'tom@gmail.com', password: '123abc', name: 'Tom', photo: 'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=785&q=80',
  bio: 'Teacher from Mexico.')
second_user = User.create(email: 'lilly@gmail.com', password: '123abc', name: 'Lilly', photo: 'https://images.unsplash.com/photo-1665686310934-8fab52b3821b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d29tYW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  bio: 'Teacher from Poland.')
User.create(name: 'Cindy', email: 'cindy@gmail.com', password: '123abc', bio: 'The blog Creator',
    photo: 'https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')

first_post = Post.create(user: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(user: first_user, title: 'Hello hello', text: 'This is my second post')
third_post = Post.create(user: first_user, title: 'Hello again', text: 'This is my third post')
fourth_post = Post.create(user: second_user, title: 'Welcome', text: 'Great to see you here')

Comment.create(post: first_post, user: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, user: second_user, text: 'Nice post' )
Comment.create(post: second_post, user: second_user, text: 'Hi Tom!' )
Comment.create(post: second_post, user: second_user, text: 'Nice post' )
Comment.create(post: third_post, user: second_user, text: 'Hi Tom!' )
Comment.create(post: fourth_post, user: second_user, text: 'Hi Tom!' )
