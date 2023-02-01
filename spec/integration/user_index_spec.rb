require 'rails_helper'

RSpec.describe 'test User#index', type: :feature do
  include RSpecHtmlMatchers

  before :each do
    @first_user = User.create(name: 'Tom',
                              photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                              bio: 'Teacher from Mexico.')

    @first_post = Post.create(user: @first_user, title: 'Hello', text: 'This is my first post')
    @second_post = Post.create(user: @first_user, title: 'Hello again', text: 'This is my second post. Welcome')

    @first_comment = Comment.create(post: @first_post, user: @first_user, text: 'Hi Tom!')
    @second_comment = Comment.create(post: @first_post, user: @first_user, text: 'Interesting')
    visit users_path
  end

  describe 'index page' do
    it 'I can see the username of all other users.' do
      expect(page).to have_content(@first_user.name)
    end

    it 'see the profile picture for each user' do
      expect(page).to have_tag('img', src: @first_user.photo)
    end

    it 'see the number of posts each user has written' do
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
    end

    it 'click on a user, I am redirected to that users show page' do
      click_on(@first_user.name)
      expect(page).to have_current_path(user_path(@first_user.id))
    end
  end
end
