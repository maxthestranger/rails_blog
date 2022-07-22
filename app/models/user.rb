class User < ApplicationRecord
  has_many :post, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    post.includes(:user).order(created_at: :DESC).limit(3)
  end
end
