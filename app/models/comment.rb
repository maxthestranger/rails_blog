class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

def update_comments_counter
  post.update(comments_counter: post.comments.count)
end
