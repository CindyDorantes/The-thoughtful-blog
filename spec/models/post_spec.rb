# Title must not be blank.
# Title must not exceed 250 characters.
# CommentsCounter must be an integer greater than or equal to zero.
# LikesCounter must be an integer greater than or equal to zero.

require 'rails_helper'

RSpec.describe Post, type: :model do
  # tests go here
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.new(user:, title: 'Hello', text: 'This is my first post') }

  before { subject.save }

  context 'Test post validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'title must not be blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Title must not exceed 250 characters' do
      long_title = 'long ' * 55
      subject.title = long_title
      expect(subject).to_not be_valid
    end

    it 'CommentsCounter must be an integer' do
      subject.comments_counter = 'foo'
      expect(subject).to_not be_valid
    end

    it 'CommentsCounter must be an integer greater than or equal to zero' do
      subject.comments_counter = 0
      expect(subject).to be_valid
    end

    it 'LikesCounter must be an integer' do
      subject.likes_counter = 'foo'
      expect(subject).to_not be_valid
    end

    it 'LikesCounter must be an integer greater than or equal to zero' do
      subject.likes_counter = 0
      expect(subject).to be_valid
    end
  end

  context 'Test user methods' do
    it 'returns last five comments' do
      Comment.create(post: subject, user:, text: 'Hi Tom!')
      Comment.create(post: subject, user:, text: 'Interesting')
      Comment.create(post: subject, user:, text: 'I dont agree')
      Comment.create(post: subject, user:, text: 'I would like to know more')
      Comment.create(post: subject, user:, text: 'Thanks for sharing')
      Comment.create(post: subject, user:, text: 'Is that all?')
      last_comments = subject.last_five_comments
      expect(last_comments.length).to eq 5
    end
  end
end
