class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_like_counter
  after_destroy :update_like_counter

  def update_like_counter
    post.update!(likes_counter: post.like.count)
  end
end
