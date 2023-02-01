require 'rails_helper'

RSpec.describe 'test Post#show', type: :feature do
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
    visit user_post_path(@first_user.id, @first_post.id)
  end

  describe 'visit post show page' do
    it 'can see the posts title' do
      expect(page).to have_content(@first_post.title)
    end

    it 'can see who wrote the post' do
      expect(page).to have_content("'#{@first_post.title}' by #{@first_user.name}")
    end

    it 'can see how many comments it has' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    it 'can see how many likes it has' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    it 'can see the post body' do
      expect(page).to have_tag('p', @first_post.text)
    end

    it 'shows the username of each commentor and the comment' do
      expect(page).to have_tag('div', with: { class: 'post-comments-preview' }) do
        with_tag 'p', text: "#{@first_comment.user.name}: #{@first_comment.text}"
      end
    end
  end
end
