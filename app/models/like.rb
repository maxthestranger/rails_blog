class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

def update_likes_counter
  self.post.update(likes_counter: self.post.likes.count)
end