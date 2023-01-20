class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, counter_cache: :posts_counter

  def last_five_comments
    comments.last(5)
  end
end
