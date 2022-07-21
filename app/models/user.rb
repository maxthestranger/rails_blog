class User < ApplicationRecord
  has_many :post, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy

  def three_recent_posts
    Post.includes(:user).limit(3).order(created_at: :desc)
  end
end
