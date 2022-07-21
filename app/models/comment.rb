class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter
    comment_count = Comment.includes(:post).count()
    Post.update(comments_counter: comment_count)
  end
end
