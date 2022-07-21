class User < ApplicationRecord
  has_many :post, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy

  def self.recent_3_posts
    Post.includes(:user).limit(3).order(created_at: :desc)
  end
end
