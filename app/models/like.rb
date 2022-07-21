class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_like_counter
    like_count = Like.includes(:post).count()
    Post.update(likes_counter: like_count)
  end
end
