class Comment < ApplicationRecord
  belongs_to :post, counter_cache: :comments_counter
  belongs_to :user
end
