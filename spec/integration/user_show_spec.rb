require 'rails_helper'

RSpec.describe 'test User#show', type: :feature do
  include RSpecHtmlMatchers

  before :each do
    @first_user = User.create(name: 'Tom',
      photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      bio: 'Teacher from Mexico.')

    @first_post = Post.create(user: @first_user, title: 'Welcome', text: 'This is my first post')
    @second_post = Post.create(user: @first_user, title: 'Hello again', text: 'This is my second post')
    @third_post = Post.create(user: @first_user, title: 'Hi', text: 'Whats up folks?')

    @first_comment = Comment.create(post: @first_post, user: @first_user, text: 'Hi Tom!')
    @second_comment = Comment.create(post: @first_post, user: @first_user, text: 'Interesting')
    visit user_path(@first_user.id)
  end

  describe 'visit user show page' do
    it 'can see the users profile picture' do
      expect(page).to have_tag('img', src: @first_user.photo)
    end

    it 'can see the users username' do
      expect(page).to have_content(@first_user.name)
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
    end

    it 'can see the users bio' do
      expect(page).to have_content(@first_user.bio)
    end

    it 'can see the users first 3 posts' do
      expect(page).to have_tag('section') do
        with_tag 'div', with: {class: 'user-post-preview'}, count: 3
      end
    end
    
    it 'can see a button that lets me view all of a users posts' do
      expect(page).to have_tag('button', :with => {:class => 'btn-see-all'})
    end

    it 'redirects me to that posts show page When I click a users post' do
      click_on(@first_post.title)
      expect(page).to have_current_path(user_post_path(@first_user.id, @first_post.id))
    end

    it 'redirects me to the users posts index page When I click to see all posts' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@first_user.id))
    end
  end
end