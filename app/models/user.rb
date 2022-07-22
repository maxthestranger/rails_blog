class User < ApplicationRecord
  has_many :post, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy

  def three_recent_posts
    post.includes(:user).order(created_at: :DESC).limit(3)
  end
end
