class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

def update_comments_counter
  self.post.update(comments_counter: self.post.comments.count)
end