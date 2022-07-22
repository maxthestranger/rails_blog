class Post < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_many :like, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counuter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def update_post_counter
    user.update(posts_counter: user.post.count)
  end

  def five_recent_comments
    comment.includes(:user).order(created_at: :DESC).limit(5)
  end
end
