require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Test Comment comments_counter method' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.create(user:, title: 'Hello', text: 'This is my first post')

    Comment.create(post:, user:, text: 'Hi Tom!')
    Comment.create(post:, user:, text: 'Interesting')
    Comment.create(post:, user:, text: 'I dont agree')
    Comment.create(post:, user:, text: 'I would like to know more')
    Comment.create(post:, user:, text: 'Thanks for sharing')
    Comment.create(post:, user:, text: 'Is that all?')

    it 'post.comments_counter should equal 6' do
      expect(post.comments_counter).to eq(6)
    end
  end
end
