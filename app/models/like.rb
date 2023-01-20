class Like < ApplicationRecord
    belongs_to :post, counter_cache: :likes_counter
    belongs_to :user
end
