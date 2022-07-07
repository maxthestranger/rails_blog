class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

def update_likes_counter
  post.update(likes_counter: post.likes.count)
end
